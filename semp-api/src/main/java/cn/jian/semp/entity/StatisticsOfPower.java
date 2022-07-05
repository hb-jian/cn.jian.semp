package cn.jian.semp.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Table
@Entity
@Data
public class StatisticsOfPower extends StatisticsEntity {
    @Column(columnDefinition = "datetime not null comment '时间'")
    private Date time;
    @Column(columnDefinition = "int(11) not null comment '数值'")
    private double value;
}
