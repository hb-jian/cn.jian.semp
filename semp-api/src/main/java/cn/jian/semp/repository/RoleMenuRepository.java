package cn.jian.semp.repository;

import cn.jian.semp.entity.RoleMenu;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface RoleMenuRepository extends BusinessBaseRepository<RoleMenu,String> {
    @Transactional
    @Modifying
    @Query(value = "delete from role_menu where role_id in (:roleIds)",nativeQuery = true)
    void deleteAllByRoleIds(List<String> roleIds);
}
