package cn.jian.semp.service;

import cn.jian.semp.entity.Device;
import cn.jian.semp.model.DeviceDto;
import cn.jian.semp.model.DeviceStatusDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IDeviceService extends ICrudService<Device, DeviceDto> {
    List<DeviceStatusDto> getStatus(List<String> ids);
    void setStatus(List<String> ids);
    List<DeviceDto> getAll();
    DeviceDto getByItemId(String itemId);
    Page<DeviceDto> getByProject(String projectId, Pageable pageable);
    Page<DeviceDto> getByOrg(String orgId, Pageable pageable);
}
