package cn.jian.semp.repository;

import cn.jian.semp.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends BusinessBaseRepository<User,String> {
    User findFirstByAccountAndDeletedIsFalse(String account);
    Page<User> findAllByOrgIdAndDeletedIsFalse(String orgId, Pageable pageable);
}
