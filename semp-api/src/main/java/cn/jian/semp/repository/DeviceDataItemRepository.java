package cn.jian.semp.repository;

import cn.jian.semp.entity.DeviceDataItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeviceDataItemRepository extends JpaRepository<DeviceDataItem,String>  {
    List<DeviceDataItem> findAllByDeviceIdAndDeletedIsFalse(String deviceId);

    DeviceDataItem findFirstByDeviceIdAndDeletedIsFalse(String deviceId);
}
