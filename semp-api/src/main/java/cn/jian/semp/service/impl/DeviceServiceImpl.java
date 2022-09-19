package cn.jian.semp.service.impl;

import cn.jian.semp.entity.Device;
import cn.jian.semp.model.DeviceDto;
import cn.jian.semp.model.DeviceStatusDto;
import cn.jian.semp.model.DeviceStatusEnum;
import cn.jian.semp.model.ProjectDto;
import cn.jian.semp.repository.DeviceRepository;
import cn.jian.semp.service.IDeviceService;
import cn.jian.semp.service.IProjectService;
import cn.jian.semp.utils.RedisUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@Service
public class DeviceServiceImpl implements IDeviceService {
    @Autowired
    private DeviceRepository deviceRepository;
//    @Autowired
//    private DeviceDataItemRepository deviceDataItemRepository;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private IProjectService projectService;

    private ObjectMapper objectMapper = new ObjectMapper();
    private String deviceCacheKey = "all";
    private long deviceCacheExpire = 24*3600;

    public Page<DeviceDto> list(String projectId, Pageable pageable){
        List<DeviceDto> devList = new ArrayList<>();

        Page<Device> devices = deviceRepository.findAllByProjectIdAndDeletedIsFalse(projectId,pageable);
        devices.getContent().forEach(dev->devList.add(entityToModel(dev)));

        return new PageImpl<DeviceDto>(devList,devices.getPageable(),devices.getTotalElements());
    }

    /**
     * 根据采集数据项检索设备
     * @param itemId
     * @return
     */
    @Override
    public DeviceDto getByItemId(String itemId) {
        Device device = null;
        try {
            if (!redisUtil.hasKey(RedisUtil.BusinessType.KepItem, deviceCacheKey)) {
                Map<String, String> devItemMap = new HashMap<>();

                Page<Device> devices = deviceRepository.findAllByDeletedIsFalse(PageRequest.of(0, 10000));
                devices.getContent().forEach(dev -> {
                    dev.getOpcItems().forEach(item -> {
                        //String itemKey = String.format("{0}:{1}:{2}",deviceDto.getId(),item.getOpcItemTypeEnum().name(),item.getMergeRuleEnum().name());
                        item.getKepIds().forEach(kepId -> {
                            try {
                                devItemMap.put(kepId, objectMapper.writeValueAsString(dev));
                            }catch (Exception ex){
                                log.error("设置设备缓存出现异常",ex);
                            }
                        });
                    });

                    redisUtil.setMap(RedisUtil.BusinessType.KepItem, deviceCacheKey, devItemMap, deviceCacheExpire);
                });
            } else {
                String jsonDev = redisUtil.getMapField(RedisUtil.BusinessType.KepItem, deviceCacheKey, itemId);
                if (StringUtils.isNotBlank(jsonDev)) {
                    device = objectMapper.readValue(jsonDev, Device.class);
                }
            }

//            if(device == null){
//                device = deviceRepository.findByItemId(itemId);
//            }
        } catch (Exception ex) {
            log.error("查询item[{}]对应备出现异常",itemId,ex);
        }

        return entityToModel(device);
    }

    @Override
    public Page<DeviceDto> getByProject(String projectId,Pageable pageable) {
        List<DeviceDto> devList = new ArrayList<>();

        Page<Device> devices = deviceRepository.findAllByProjectIdAndDeletedIsFalse(projectId, PageRequest.of(0,10000));
        devices.getContent().forEach(dev->devList.add(entityToModel(dev)));

        return new PageImpl<DeviceDto>(devList,devices.getPageable(),devices.getTotalElements());
    }

    @Override
    public Page<DeviceDto> getByOrg(String orgId,Pageable pageable) {
        List<DeviceDto> devList = new ArrayList<>();

        Page<Device> devices = StringUtils.isBlank(orgId)
                ? deviceRepository.findAllByDeletedIsFalse(pageable)
                : deviceRepository.findAllByOrgIdAndDeletedIsFalse(orgId, pageable);
        devices.getContent().forEach(dev->devList.add(entityToModel(dev)));

        return new PageImpl<DeviceDto>(devList,devices.getPageable(),devices.getTotalElements());
    }


    @Override
    public DeviceDto get(String id) {
        Device device = deviceRepository.findByIdAndDeletedIsFalse(id);
        return entityToModel(device);
    }

    @Override
    public Page<DeviceDto> page(String ownerId, Pageable pageable) {
        List<DeviceDto> devList = new ArrayList<>();

        Page<Device> devices = deviceRepository.findAllByProjectIdAndDeletedIsFalse(ownerId,pageable);
        devices.getContent().forEach(dev->devList.add(entityToModel(dev)));

        return new PageImpl<DeviceDto>(devList,devices.getPageable(),devices.getTotalElements());
    }

    @Override
    public Device create(DeviceDto data) {

        ProjectDto projectDto = projectService.get(data.getProjectId());
        if(projectDto != null){
            data.setOrgId(projectDto.getOrgId());
        }
        Device device = deviceRepository.saveAndFlush(modelToEntity(data));
        //当数据发生变更后，清除缓存重新加载数据
        redisUtil.delete(RedisUtil.BusinessType.DEVICEDB, deviceCacheKey);
        return device;
    }

    @Override
    public void update(DeviceDto data) {
        deviceRepository.saveAndFlush(modelToEntity(data));
        //当数据发生变更后，清除缓存重新加载数据
        redisUtil.delete(RedisUtil.BusinessType.DEVICEDB, deviceCacheKey);
    }

    @Override
    public void delete(List<String> ids) {
        deviceRepository.deleteByIdInAndDeletedIsFalse(ids);
        //当数据发生变更后，清除缓存重新加载数据
        redisUtil.delete(RedisUtil.BusinessType.DEVICEDB, deviceCacheKey);
    }

    @Override
    public DeviceDto entityToModel(Device dev){
//        List<OpcDataItemDto> itemDtos = new ArrayList<>();

//        List<DeviceDataItem> dataItems = deviceDataItemRepository.findAllByDeviceIdAndDeletedIsFalse(dev.getId());
//        dataItems.forEach(item->{
//            OpcDataItemDto itemDto = new OpcDataItemDto();
//            itemDto.setOpcItemTypeEnum(item.getItemType());
//            itemDto.setKepId(item.getItem());
//            itemDtos.add(itemDto);
//        });

        //DeviceDataItem dataItem = deviceDataItemRepository.findFirstByDeviceIdAndDeletedIsFalse(dev.getId());

        DeviceDto devDto = new DeviceDto();
        devDto.setId(dev.getId());
        devDto.setOrgId(dev.getOrgId());
        devDto.setProjectId(dev.getProjectId());
        devDto.setName(dev.getName());
        devDto.setDataItems(dev.getOpcItems());

        return devDto;
    }

    @Override
    public Device modelToEntity(DeviceDto data) {
        Device device = new Device();
        device.setName(data.getName());
        //device.setDescription();
        device.setOrgId(data.getOrgId());
        device.setProjectId(data.getProjectId());
        device.setOpcItems(data.getDataItems());

        return device;
    }

    /**
     * 获取设备状态
     * @param ids
     * @return
     */
    public List<DeviceStatusDto> getStatus(List<String> ids){
        List<DeviceStatusDto> statusList = new ArrayList<>();

        ids.forEach(id->{
            DeviceStatusDto statusDto = new DeviceStatusDto();
            statusDto.setId(id);

            String cache = redisUtil.getAttribute(RedisUtil.BusinessType.DeviceStatus,id);
            statusDto.setStatus(cache==null? DeviceStatusEnum.offline: DeviceStatusEnum.online);

            statusList.add(statusDto);
        });

        return statusList;
    }

    /**
     * 设置设备状态
     * @param ids
     */
    public void setStatus(List<String> ids){
        ids.forEach(id->redisUtil.setAttribute(RedisUtil.BusinessType.DeviceStatus,id,System.currentTimeMillis()+"",RedisUtil.VALIDITY_DEVICESTATUS));
    }

    @Override
    public List<DeviceDto> getAll() {
        Page<Device> devices = deviceRepository.findAllByDeletedIsFalse(PageRequest.of(0,10000));
        return devices.getContent().stream().map(dev->entityToModel(dev)).collect(Collectors.toList());
    }
}
