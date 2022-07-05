package cn.jian.semp.repository;

import cn.jian.semp.entity.StatisticsOfRefrigerating;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface StatisticsOfRefrigeratingRepository extends JpaRepository<StatisticsOfRefrigerating,String>  {
    List<StatisticsOfRefrigerating> findAllByProjectIdAndTimeBetweenOrderByTimeDesc(String projectId, Date startTime, Date endTime);
}
