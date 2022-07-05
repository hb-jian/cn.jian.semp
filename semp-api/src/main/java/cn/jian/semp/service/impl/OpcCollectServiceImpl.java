package cn.jian.semp.service.impl;

import cn.jian.semp.entity.OpcData;
import cn.jian.semp.model.DeviceDto;
import cn.jian.semp.model.OpcCallbackDataModel;
import cn.jian.semp.model.OpcConnectionConfigDto;
import cn.jian.semp.model.ProjectDto;
import cn.jian.semp.mq.JedisOpcDataPublisher;
import cn.jian.semp.repository.OpcDataRepository;
import cn.jian.semp.service.IOpcCollectService;
import cn.jian.semp.utils.RedisUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.jinterop.dcom.common.JIException;
import org.jinterop.dcom.core.JIString;
import org.jinterop.dcom.core.JIVariant;
import org.openscada.opc.lib.common.ConnectionInformation;
import org.openscada.opc.lib.da.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.Executors;

@Slf4j
@Service
public class OpcCollectServiceImpl implements IOpcCollectService {
    //https://www.cnblogs.com/Runawayprogrammer/p/13212448.html

//    @Value("${system.opc.client.host}")
//    private String opcHost;
//    @Value("${system.opc.client.domain}")
//    private String opcDomain;
//    @Value("${system.opc.client.user}")
//    private String opcUser;
//    @Value("${system.opc.client.pwd}")
//    private String opcPwd;
//    @Value("${system.opc.server.clsid}")
//    private String opcClsid;

    private Hashtable<String, Server> serverMap = new Hashtable<>();
    private Hashtable<String, OpcData> dataCache = new Hashtable<>();
    @Autowired
    private ProjectServiceImpl projectServiceImpl;
    @Autowired
    private DeviceServiceImpl deviceServiceImpl;
    @Autowired
    private OpcDataRepository opcDataRepository;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private JedisOpcDataPublisher opcDataPublisher;
    private ObjectMapper jsonMapper = new ObjectMapper();

    private String KepItemKey = "All";
    private long KepItemCacheExpire = 7*24*3600;
    @Value("${system.opc.collect.interval}")
    private int dataCollectInterval;//数据采集时间间隔，单位为毫秒

//    //读取PLC点位
//    public void read() {
//        log.info("【OPCService】启动数据读取服务");
//        // 连接信息
//        ConnectionInformation ci = new ConnectionInformation();
//        ci.setHost(opcHost);         // 电脑IP
//        ci.setDomain(opcDomain);                  // 域，为空就行
//        ci.setUser(opcUser);             // 电脑上自己建好的用户名 （之前DCOM 配置过）
//        ci.setPassword(opcPwd);          // 密码（用户名密码）
//
//        // 使用MatrikonOPC Server的配置
//        // ci.setClsid("F8582CF2-88FB-11D0-B850-00C0F0104305"); // MatrikonOPC的注册表ID，可以在“组件服务”里看到
//        // final String itemId = "u.u";    // MatrikonOPC Server上配置的项的名字按实际
//
//        // 使用KEPServer的配置
//        ci.setClsid(opcClsid); // KEPServer的注册表ID，可以在“组件服务”里看到
//        final String itemId = "东方仙玛.设备 1.TS01";    // KEPServer上配置的项的名字，没有实际PLC，用的模拟器：simulator （KEPserver 建立通道，建立设备，建立点位）通过标记点位名字定位要读取的值
//        // final String itemId = "通道 1.设备 1.标记 1";
//
//        // 启动服务
//        final Server server = new Server(ci, Executors.newSingleThreadScheduledExecutor());
//
//        try {
//            // 连接到服务
//            server.connect();
//            // add sync access, poll every 500 ms，启动一个同步的access用来读取地址上的值，线程池每500ms读值一次
//            // 这个是用来循环读值的，只读一次值不用这样
//            final AccessBase access = new SyncAccess(server, 500);
//            // 这是个回调函数，就是读到值后执行这个打印，是用匿名类写的，当然也可以写到外面去
//            access.addItem(itemId, new DataCallback() {
//                @Override
//                public void changed(Item item, ItemState itemState) {
//                    int type = 0;
//                    try {
//                        type = itemState.getValue().getType(); // 类型实际是数字，用常量定义的
//                    } catch (JIException e) {
//                        log.error("【OPCService】数据回调出现异常", e);
//                    }
//
//                    log.info("【OPCService】时间戳：{}，数据类型：{},详细信息：{}", itemState.getTimestamp().getTime(), type, itemState);
//                    // 如果读到是short类型的值
//                    if (type == JIVariant.VT_I2) {
//                        short n = 0;
//                        try {
//                            n = itemState.getValue().getObjectAsShort();
//                        } catch (JIException e) {
//                            log.error("【OPCService】数据值读取异常", e);
//                        }
//
//                        log.info("【OPCService】参数值type=short,value={}", n);
//                    }
//
//                    // 如果读到是字符串类型的值
//                    if (type == JIVariant.VT_BSTR) {  // 字符串的类型是8
//                        JIString value = null;
//                        try {
//                            value = itemState.getValue().getObjectAsString();
//                        } catch (JIException e) {
//                            e.printStackTrace();
//                        } // 按字符串读取
//                        String str = value.getString(); // 得到字符串
//                        log.info("【OPCService】参数值type=String,value=%s", str);
//                    }
//                }
//            });
//            // start reading，开始读值
//            access.bind();
//            // wait a little bit，有个10秒延时
//            Thread.sleep(10 * 1000);
//            // stop reading，停止读取
//            access.unbind();
//
//        } catch (final JIException e) {
//            log.error(String.format("【OPCService】数据错误异常，错误码：%s，异常信息：%s", e.getErrorCode(), server.getErrorMessage(e.getErrorCode())), e);
//        } catch (Exception ex) {
//            log.error("【OPCService】数据读取异常", ex);
//        }
//    }


    /**
     * 启动Opc数据采集任务
     * 1、获取所有需要采集的项目，每个项目分配一个线程
     * 2、获取项目内设备清单
     * 3、获取设备采集数据项
     * 4、将设备采集项添加到采集服务列表，启动采集任务
     */
    public void startCollector() {

        try {
            log.info("【OPCService】开始启动Opc项目采集服务");
            Page<ProjectDto> projects = projectServiceImpl.page(null, PageRequest.of(0,1000));
            projects.getContent().forEach(pro -> {
                try {
                    //初始化项目使用的OpcServer
                    Server opcServer = getOpcServer(pro.getOpcConfig());

                    //获取项目设备列表，并将设备允许的采集项添加到Opc监听服务中
                    Page<DeviceDto> devices = deviceServiceImpl.list(pro.getId(), PageRequest.of(0, 1000));
                    List<String> items = new ArrayList<>();
                    devices.getContent().forEach(dev->{
                        dev.getDataItems().forEach(data->{
                            items.addAll(data.getKepIds());
                            //items.add(data.getKepId());
                        });
                    });

                    if(items.size() == 0)
                        return;

                    initOpcReader(opcServer, items);
                } catch (Exception ex) {
                    log.error("【OPCService】启动OPC采集服务出现异常",ex);
                }
            });
            log.info("【OPCService】Opc项目采集服务启动完成");
        } catch (Exception ex) {
            log.error("【OPCService】启动Opc数据监听服务出现异常", ex);
        }
    }

    /**
     * 构造Opc连接对象
     * @param opcConfig opc连接配置
     * @return
     * @throws Exception
     */
    private Server getOpcServer(OpcConnectionConfigDto opcConfig) throws Exception {
        if(serverMap.containsKey(opcConfig.getClsid()))
            return serverMap.get(opcConfig.getClsid());

        ConnectionInformation opcConnect = new ConnectionInformation();
        opcConnect.setHost(opcConfig.getHost());         // 电脑IP
        opcConnect.setDomain(opcConfig.getDomain());     // 域，为空就行
        opcConnect.setUser(opcConfig.getUser());         // 电脑上自己建好的用户名 （之前DCOM 配置过）
        opcConnect.setPassword(opcConfig.getPwd());      // 密码（用户名密码）
        // 使用KEPServer的配置
        opcConnect.setClsid(opcConfig.getClsid());       // KEPServer的注册表ID，可以在“组件服务”里看到

        Server server = new Server(opcConnect, Executors.newSingleThreadScheduledExecutor());
        server.connect();
        log.info("【OPCService】启动Opc监听服务[clisid:{},host:{}]", opcConnect.getClsid(), opcConnect.getHost());

        serverMap.put(opcConfig.getClsid(),server);
        return server;
    }

    /**
     * 初始化Opc读取器
     * @param server
     * @param items
     */
    private void initOpcReader(Server server, List<String> items) {
        try {
            // add sync access, poll every 500 ms，启动一个同步的access用来读取地址上的值，线程池每500ms读值一次
            // 这个是用来循环读值的，只读一次值不用这样
            AccessBase access = new SyncAccess(server, dataCollectInterval);
            DataCallback callback = dataCallback();
            // 这是个回调函数，就是读到值后执行这个打印，是用匿名类写的，当然也可以写到外面去
            items.forEach(item -> {
                try {
                    access.addItem(item,callback);
                } catch (Exception ex) {
                    log.error("【OPCService】添加数据监控[id:{}]出现异常", item, ex);
                }
            });

            // start reading，开始读值
            access.bind();
            // wait a little bit，有个10秒延时
            Thread.sleep(10 * 1000);
            //}
            //access.unbind();
        } catch (JIException e) {
            log.error(String.format("【OPCService】数据错误异常，错误码：%s，异常信息：%s", e.getErrorCode(), server.getErrorMessage(e.getErrorCode())), e);
        } catch (Exception ex) {
            log.error("【OPCService】OPC服务异常", ex);
            server.disconnect();
        }
    }

    @Bean
    private DataCallback dataCallback() {
        return new DataCallback() {
            @Override
            public void changed(Item item, ItemState itemState) {
                int type = 0;
                try {
                    type = itemState.getValue().getType(); // 类型实际是数字，用常量定义的
                } catch (JIException e) {
                    log.error("【OPCCallback-{}】数据类型解析异常", item.getId(), e);
                }

                log.debug("【OPCCallback-{}】时间戳：{}，数据类型：{},详细信息：{}", item.getId(), itemState.getTimestamp().getTime(), type, itemState);
                double dataValue = 0;

                switch (type) {
                    case JIVariant.VT_I2:
                        short n = 0;
                        try {
                            n = itemState.getValue().getObjectAsShort();
                        } catch (JIException e) {
                            log.error("【OPCCallback-{}】数据值读取异常", item.getId(), e);
                        }
                        log.debug("【OPCCallback-{}】参数值type=short,value={}", item.getId(), n);
                        dataValue = n;
                        break;
                    case JIVariant.VT_BSTR:
                        JIString value = null;
                        try {
                            value = itemState.getValue().getObjectAsString();
                        } catch (JIException e) {
                            log.error("【OPCCallback-{}】数据值读取异常", item.getId(), e);
                        } // 按字符串读取
                        String str = value.getString(); // 得到字符串
                        log.debug("【OPCCallback-{}】参数值type=String,value={}", item.getId(), str);
                        break;
                    case JIVariant.VT_UI2:
                    case JIVariant.VT_UI4:
                        Number num = 0;
                        try {
                            num = itemState.getValue().getObjectAsUnsigned().getValue();
                        } catch (JIException e) {
                            log.error("【OPCCallback-{}】数据值读取异常", item.getId(), e);
                        } // 按字符串读取
                        dataValue = num.doubleValue(); // 得到字符串
                        log.debug("【OPCCallback-{}】参数值type=Number,value={}", item.getId(), dataValue);
                        break;
                    default:
                        break;
                }


                try {
                    OpcCallbackDataModel opcData = new OpcCallbackDataModel();
                    opcData.setItemId(item.getId());
                    opcData.setTimestamp(itemState.getTimestamp().getTimeInMillis());
                    opcData.setData(dataValue);

                    opcDataPublisher.send(jsonMapper.writeValueAsString(opcData));
                    //dataProcess(item.getId(),itemState.getTimestamp().getTime(),dataValue);
                } catch (Exception ex) {
                    log.error("投递消息出现异常",ex);
                }
            }
        };
    }

//    /**
//     * 缓存采集数据，数据排序
//     * @param itemId
//     * @param value
//     */
//    @Override
//    public void dataProcess(String message) {
//        DeviceDto deviceDto = deviceServiceImpl.getByItemId(itemId);
//        if (deviceDto != null) {
//            //设置设备在线状态
//            List<String> deviceIds = new ArrayList<>();
//            deviceIds.add(deviceDto.getId());
//            deviceServiceImpl.setStatus(deviceIds);
//
//            //缓存设备采集数据
//            Optional<OpcDataItemDto> dataItem = deviceDto.getDataItems().stream().filter(item -> item.getKepIds().contains(itemId)).findFirst();
//            if (dataItem.isPresent()) {
//                OpcData existData = dataCache.get(itemId);
//                if(existData == null || existData.getValue()>value){
//                    OpcData opcData = new OpcData(deviceDto.getProjectId(), deviceDto.getId(), dataItem.get().getOpcItemTypeEnum(), value);
//                    opcData.setCreated(time);
//                    opcData.setUpdated(time);
//
//                    dataCache.put(itemId, opcData);
//                }
//            }
//        }
//    }


    /**
     * 获取指定item的数据缓存key
     * @param itemId
     * @return
     */
    private String getItemCacheKey(String itemId){
        if(!redisUtil.hasKey(RedisUtil.BusinessType.KepItem,KepItemKey)){
            Map<String,String> devItemMap = new HashMap<>();

            List<DeviceDto> devices = deviceServiceImpl.getAll();
            devices.forEach(deviceDto -> {
                deviceDto.getDataItems().forEach(item->{
                    String itemKey = String.format("{0}:{1}:{2}",deviceDto.getId(),item.getOpcItemTypeEnum().name(),item.getMergeRuleEnum().name());
                    item.getKepIds().forEach(kepId->{
                        devItemMap.put(kepId,itemKey);
                    });
                });

                redisUtil.setMap(RedisUtil.BusinessType.KepItem,KepItemKey,devItemMap,KepItemCacheExpire);
            });
        }

        return redisUtil.getMapField(RedisUtil.BusinessType.KepItem,KepItemKey,itemId);
    }


    private void setDataCache(){
        //TODO:zset登记汇报信息，key:devid:数据类型:计算类型,value:数据,score:汇报时间，通过定时器定期汇总数据，计算规则：解析key中数据类型和计算类型，通过score筛选时间范围内数据，形成计算结果
    }

    /**
     * 定期将缓存数据批量同步到数据库
     */
    @Scheduled(cron = "${task.opc.save.cron}")
    private void cacheToDb() {
        try {
            opcDataRepository.saveAll(dataCache.values());
            dataCache.clear();
        } catch (Exception ex) {
            log.error("【OPCService】保存Opc数据出现异常", ex);
        }

    }
}
