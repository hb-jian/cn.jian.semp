package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysOrg;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysOrgService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 企业管理接口
 */
@Api(tags = "机构管理")
@RequestMapping("/system/org")
@RestController
public class SysOrgController extends BaseController {
    @Autowired
    ISysOrgService orgService;

    /**
     * 新建
     * @param
     * @return
     */
    @Operation(summary = "登记")
    @PostMapping("/add")
//    @ApiImplicitParams({
//            @ApiImplicitParam(name="Authorization",value = "授权信息",paramType = "Header",required = true)
//    })
    public AjaxResult add(@RequestBody SysOrg sysOrg){
        orgService.add(sysOrg);
        return AjaxResult.success();
    }

    /**
     * 修改
     * @param
     * @return
     */
    @Operation(summary = "更新")
    @PostMapping("/update")
//    @ApiImplicitParams({
//            @ApiImplicitParam(name="Authorization",value = "授权信息",paramType = "Header",required = true),
//    })
    public AjaxResult update(@RequestBody SysOrg sysOrg){
        orgService.update(sysOrg);
        return AjaxResult.success();
    }

    /**
     * 删除
     * @param
     * @return
     */
    @Operation(summary = "删除")
    @PostMapping("/delete")
    public AjaxResult delete(@RequestBody SysOrg sysOrg){
        //TODO:删除机构需要清理对应的资源（部门、管理员、用户以及业务数据）
        orgService.delete(sysOrg.getOrgId());
        return AjaxResult.success();
    }

    /**
     * 详情
     * @param id
     * @return
     */
    @Operation(summary = "详情")
    @GetMapping("/{id}")
    @ApiImplicitParams({
            //@ApiImplicitParam(name="Authorization",value = "授权信息",paramType = "Header",required = true),
            @ApiImplicitParam(name="id",value = "机构编号",paramType = "path",required = true)
    })
    public AjaxResult get(@PathVariable String id){
        SysOrg org = orgService.get(id);
        return AjaxResult.success(org);
    }

    /**
     * 结构列表
     * @param
     * @return
     */
    @Operation(summary = "分页列表")
    @GetMapping("/list")
//    @ApiImplicitParams({
//            @ApiImplicitParam(name="Authorization",value = "授权信息",paramType = "Header",required = true),
//            @ApiImplicitParam(name="pageIndex",value = "分页序号",paramType = "query",defaultValue = "1"),
//            @ApiImplicitParam(name="pageSize",value = "分页数量",paramType = "query",defaultValue = "10"),
//    })
//    public TableDataInfo list(@RequestParam(name = "pageIndex",required = false,defaultValue = "0") Integer pageIndex,
//                              @RequestParam(name = "pageSize",required = false,defaultValue = "10") Integer pageSize){
//        if(pageIndex == null || pageIndex<1)
//            pageIndex = 1;
//
//        if(pageSize == null || pageSize <=0 || pageSize>1000)
//            pageSize = 10;
    public TableDataInfo list(){
        String userOrgId = null;
        //@2022.08.26 modify by wj，根据当前用户登录信息，填充所属机构，增加机构数据过滤功能
        if(!SecurityUtils.getLoginUser().isSystem() && StringUtils.isBlank(SecurityUtils.getOrgId())){
            userOrgId = SecurityUtils.getOrgId();
        }

        List<SysOrg> orgList = new ArrayList<>();
        if(StringUtils.isBlank(userOrgId)){
            startPage();
            orgList = orgService.list();
        }else{
            SysOrg userOrg = orgService.get(userOrgId);
            orgList.add(userOrg);
        }

        return getDataTable(orgList);
    }
}
