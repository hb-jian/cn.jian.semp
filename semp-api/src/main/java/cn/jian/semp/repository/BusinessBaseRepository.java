package cn.jian.semp.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.NoRepositoryBean;

import java.util.List;

@NoRepositoryBean
public interface BusinessBaseRepository<T, ID> extends JpaRepository<T,ID>  {
    T findByIdAndDeletedIsFalse(String id);

    @Query(value = "update T set deleted=true where id in (:ids) and deleted=false",nativeQuery = true)
    void deleteByIdInAndDeletedIsFalse(List<String> ids);

    Page<T> findAllByDeletedIsFalse(Pageable pageable);

    //Page<T> findAllByOrgIdAndDeletedIsFalse(String orgId, Pageable pageable);
}
