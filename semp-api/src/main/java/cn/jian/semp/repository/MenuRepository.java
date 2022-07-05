package cn.jian.semp.repository;

import cn.jian.semp.entity.Menu;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuRepository extends BusinessBaseRepository<Menu,String> {
    List<Menu> findAllByDeletedIsFalseAndParentId(String parentId);

    @Query(value = "select m.* from role_menu rm inner join menu m on m.id=rm.menu_id where rm.role_id=:roleId and m.deleted=0 ",nativeQuery = true)
    List<Menu> findAllByRoleIdAndDeletedIsFalse(@Param("roleId") String roleId);

    List<Menu> findAllBySystemFlagAndDeletedIsFalse(boolean isSystem);

    @Query(value = "select m.* from role_menu rm inner join menu m on m.id=rm.menu_id inner join role rl on rl.id=rm.role_id where m.deleted=0 and rl.org_id=:orgId ",nativeQuery = true)
    List<Menu> findAllByOrgIdAndDeletedIsFalse(@Param("orgId") String orgId);
}
