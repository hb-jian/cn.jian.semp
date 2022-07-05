package cn.jian.semp.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.List;
import java.util.UUID;

/**
 * 机构信息
 */
@Schema
@Data
public class OrganizationDto {
    public OrganizationDto(){this.id = UUID.randomUUID().toString().trim().replaceAll("-", "");}
    /**
     * 机构编号
     */
    @Schema(name = "id",description = "企业编号，更新操作时必须携带")
    private String id;
    /**
     * 结构名称
     */
    @Schema(name = "name",description = "名称",required = true)
    private String name;
    /**
     * 企业数据大屏地址
     */
    @Schema(name = "datavUrl",description = "企业大屏地址")
    private String dataViewUrlOfOrg;

    /**
     * 项目数据大屏地址
     */
    @Schema(name = "datavUrl",description = "项目大屏地址")
    private String dataViewUrlOfProject;

    /**
     * 企业菜单
     */
    @Schema(name = "menus",description = "企业菜单")
    private List<MenuDto> menus;
}
