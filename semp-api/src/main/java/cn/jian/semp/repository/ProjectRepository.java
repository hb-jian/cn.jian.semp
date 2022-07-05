package cn.jian.semp.repository;

import cn.jian.semp.entity.Project;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

@Repository
public interface ProjectRepository extends BusinessBaseRepository<Project,String> {
    Page<Project> findAllByOrgIdAndDeletedIsFalse(String orgId, Pageable pageable);
    Page<Project> findAllByDeletedIsFalse(Pageable pageable);
}
