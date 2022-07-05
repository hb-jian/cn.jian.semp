package cn.jian.semp.repository;

import cn.jian.semp.entity.RoleDataActionMapping;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDataActionRepository extends BusinessBaseRepository<RoleDataActionMapping,String> {
    List<RoleDataActionMapping> findAllByRoleIdAndDeletedIsFalse(String roleId);
}
