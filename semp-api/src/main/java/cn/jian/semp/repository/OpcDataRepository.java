package cn.jian.semp.repository;

import cn.jian.semp.entity.OpcData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OpcDataRepository extends JpaRepository<OpcData,String>  {

}
