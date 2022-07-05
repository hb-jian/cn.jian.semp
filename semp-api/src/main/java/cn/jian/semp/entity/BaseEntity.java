package cn.jian.semp.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.util.Date;
import java.util.UUID;

/**
 * @author wangjian
 * @version 1.0
 * @created 23-11月-2021 14:40:01
 */
@MappedSuperclass
@Data
public class BaseEntity {
	public BaseEntity(){
		this.id = UUID.randomUUID().toString().trim().replaceAll("-", "");
		created = new Date();
		updated = new Date();
	}

	/**
	 * 编号
	 */
	@Id
	private String id;
	/**
	 * 创建时间
	 */
	@Column(columnDefinition = "datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'")
	private Date created;
	/**
	 * 更新时间
	 */
	@Column(columnDefinition = "datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间'")
	private Date updated;
}