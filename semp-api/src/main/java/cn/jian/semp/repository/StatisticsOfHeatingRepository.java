package cn.jian.semp.repository;

import cn.jian.semp.entity.StatisticsOfHeating;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface StatisticsOfHeatingRepository extends JpaRepository<StatisticsOfHeating,String> {
    List<StatisticsOfHeating> findAllByProjectIdAndTimeBetweenOrderByTimeDesc(String projectId, Date startTime, Date endTime);
}
