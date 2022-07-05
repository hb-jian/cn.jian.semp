package cn.jian.semp.repository;

import cn.jian.semp.entity.Role;
import cn.jian.semp.model.RoleTypeEnum;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends BusinessBaseRepository<Role,String> {
    Role findFirstByTypeAndOrgIdAndDeletedIsFalse(RoleTypeEnum roleType, String orgId);

    Page<Role> findAllByOrgIdAndDeletedIsFalse(String orgId, Pageable pageable);

    Page<Role> findAllByDeletedIsFalse(Pageable pageable);
}
