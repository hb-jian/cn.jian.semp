package cn.jian.semp.entity;

import cn.jian.semp.model.RoleTypeEnum;
import lombok.Data;
import javax.persistence.*;

/**
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@Table
@Entity
@Data
public class Role extends BusinessEntity {

	/**
	 * 所属机构编号
	 */
	@Column(columnDefinition = "varchar(32) not null comment '机构编号'")
	private String orgId = "-1";
	/**
	 * 是否启用
	 */
	@Column(columnDefinition = "bit default 1 comment '是否启用'")
	private Boolean enabled = true;
	/**
	 * 角色类型
	 */
	@Enumerated(EnumType.STRING)
	@Column(columnDefinition = "varchar(32) not null comment '数据类型'")
	private RoleTypeEnum type;
	/**
	 * 默认角色标记
	 */
	@Column(columnDefinition = "bit default 0 comment '是否为默认角色'")
	private Boolean defaultFlag = true;
}