package cn.jian.semp.entity;

import cn.jian.semp.model.DataTypeEnum;
import lombok.Data;
import javax.persistence.*;

/**
 * 角色数据权限映射
 * 为了适配网站和接口数据权限控制，分离后台菜单与数据权限关系
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@Table
@Entity
@Data
public class RoleDataActionMapping extends BusinessEntity {

	/**
	 * 角色编号
	 */
	@Column(columnDefinition = "varchar(32) not null comment '角色编号'")
	private String roleId;
	/**
	 * 数据类型
	 */
	@Column(columnDefinition = "varchar(32) not null comment '数据类型'")
	@Enumerated(EnumType.STRING)
	private DataTypeEnum dataType;
	/**
	 * 操作方法，多个使用|分隔，*表示所有权限
	 */
	@Column(columnDefinition = "varchar(128) not null comment '允许执行的方法，多个使用逗号分隔，*表示所有方法'")
	private String method;
}