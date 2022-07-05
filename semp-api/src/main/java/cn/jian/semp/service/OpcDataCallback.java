package cn.jian.semp.service;

import lombok.extern.slf4j.Slf4j;
import org.jinterop.dcom.common.JIException;
import org.jinterop.dcom.core.JIString;
import org.jinterop.dcom.core.JIVariant;
import org.openscada.opc.lib.da.DataCallback;
import org.openscada.opc.lib.da.Item;
import org.openscada.opc.lib.da.ItemState;

@Slf4j
public class OpcDataCallback implements DataCallback {
    @Override
    public void changed(Item item, ItemState itemState) {
        int type = 0;
        try {
            type = itemState.getValue().getType(); // 类型实际是数字，用常量定义的
        } catch (JIException e) {
            log.error("【OPCCallback-{}】数据类型解析异常",item.getId(),e);
        }

        log.debug("【OPCCallback-{}】时间戳：{}，数据类型：{},详细信息：{}",item.getId(),itemState.getTimestamp().getTime(),type,itemState);
        switch(type) {
            case JIVariant.VT_I2:
                short n = 0;
                try {
                    n = itemState.getValue().getObjectAsShort();
                } catch (JIException e) {
                    log.error("【OPCCallback-{}】数据值读取异常",item.getId(), e);
                }
                log.debug("【OPCCallback-{}】参数值type=short,value={}",item.getId(),n);
                break;
            case JIVariant.VT_BSTR:
                JIString value = null;
                try {
                    value = itemState.getValue().getObjectAsString();
                } catch (JIException e) {
                    log.error("【OPCCallback-{}】数据值读取异常",item.getId(), e);
                } // 按字符串读取
                String str = value.getString(); // 得到字符串
                log.debug("【OPCCallback-{}】参数值type=String,value={}",item.getId(), str);
                break;
            default:
                break;
                //TODO:生成统计数据
        }
    }
}
