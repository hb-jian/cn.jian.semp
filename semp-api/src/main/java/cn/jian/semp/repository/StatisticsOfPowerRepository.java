package cn.jian.semp.repository;

import cn.jian.semp.entity.StatisticsOfPower;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface StatisticsOfPowerRepository extends JpaRepository<StatisticsOfPower,String>  {
    List<StatisticsOfPower> findAllByProjectIdAndTimeBetweenOrderByTimeDesc(String projectId, Date startTime, Date endTime);
}
