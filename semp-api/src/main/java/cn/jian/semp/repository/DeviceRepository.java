package cn.jian.semp.repository;

import cn.jian.semp.entity.Device;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DeviceRepository extends BusinessBaseRepository<Device,String> {
    Page<Device> findAllByProjectIdAndDeletedIsFalse(String projectId, Pageable pageable);

    Page<Device> findAllByOrgIdAndDeletedIsFalse(String orgId, Pageable pageable);

    @Query(value = "select de.* from device de inner join device_data_item ddi on ddi.device_id=de.id where ddi.item=:itemId and ddi.deleted=0 and de.deleted=0 limit 1",nativeQuery = true)
    Device findByItemId(@Param("itemId") String itemId);
}
