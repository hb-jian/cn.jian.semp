package cn.jian.semp.entity;

import cn.jian.semp.model.ActionMethodEnum;
import cn.jian.semp.model.DataTypeEnum;
import lombok.Data;

import javax.persistence.*;

/**
 * 数据操作权限
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@Table
@Entity
@Data
public class DataAction extends BusinessEntity {

	/**
	 * 数据类型
	 */
	@Column(columnDefinition = "varchar(32) not null comment '数据类型'")
	@Enumerated(EnumType.STRING)
	private DataTypeEnum dataType;
	/**
	 * 操作
	 */
	@Column(columnDefinition = "varchar(32) not null comment '操作'")
	@Enumerated(EnumType.STRING)
	private ActionMethodEnum method;

	/**
	 * 操作名称
	 */
	@Column(columnDefinition = "varchar(32) not null comment '操作名称'")
	private String methodName;
}