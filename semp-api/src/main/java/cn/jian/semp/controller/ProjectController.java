package cn.jian.semp.controller;

import cn.jian.semp.model.JsonResponse;
import cn.jian.semp.model.ProjectDto;
import cn.jian.semp.model.api.ProjectCreateOrUpdateReq;
import cn.jian.semp.service.IProjectService;
import com.github.pagehelper.PageInfo;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.SecurityUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.v3.oas.annotations.Operation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpEntity;
import org.springframework.web.bind.annotation.*;

//import cn.jian.semp.semp1.service.IUserService;
//import org.springframework.security.access.prepost.PreAuthorize;


/**
 * 项目管理接口
 */
@Slf4j
@Api(tags = "项目管理")
@RequestMapping("/energy/project")
@RestController
public class ProjectController extends BaseController {

    @Autowired
    IProjectService projectService;
//    @Autowired
//    IUserService userService;

    /**
     * 新建
     *
     * @param createReq
     * @return
     */
    //@PreAuthorize("@urs.hasPerminission('project.create')")
    @Operation(summary = "登记")
    @PostMapping("/create")
//    @ApiImplicitParams({
//            @ApiImplicitParam(name = "Authorization", value = "授权信息", paramType = "Header", required = true)
//    })
    public AjaxResult create(@RequestBody ProjectCreateOrUpdateReq createReq) {
        projectService.create(createReq);
        return AjaxResult.success();
    }

    /**
     * 修改
     *
     * @param updateReq
     * @return
     */
    @Operation(summary = "更新")
    @PostMapping("/update")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "Authorization", value = "授权信息", paramType = "Header", required = true)
    })
    public AjaxResult update(@RequestBody ProjectCreateOrUpdateReq updateReq) {
        projectService.update(updateReq);
        return AjaxResult.success();
    }

    /**
     * 详情
     *
     * @param id
     * @return
     */
    @Operation(summary = "详情")
    @GetMapping("/{id}")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "Authorization", value = "授权信息", paramType = "Header", required = true),
            @ApiImplicitParam(name = "id", value = "项目编号", paramType = "path", required = true)
    })
    public AjaxResult get(@PathVariable String id) {
        ProjectDto proDto = projectService.get(id);

        return AjaxResult.success(proDto);
    }

    /**
     * 结构列表
     *
     * @param pageIndex
     * @return
     */
    @Operation(summary = "分页列表")
    @GetMapping("/list")
//    @ApiImplicitParams({
//            @ApiImplicitParam(name = "Authorization", value = "授权信息", paramType = "Header", required = true),
//            @ApiImplicitParam(name = "pageIndex", value = "分页序号", paramType = "query", defaultValue = "0"),
//            @ApiImplicitParam(name = "pageSize", value = "分页数量", paramType = "query", defaultValue = "10")
//    })
    public TableDataInfo list(@RequestParam(name = "pageIndex", required = false, defaultValue = "0") Integer pageIndex,
                              @RequestParam(name = "pageSize", required = false, defaultValue = "10") Integer pageSize) {
        if (pageIndex == null || pageIndex < 1)
            pageIndex = 1;

        if (pageSize == null || pageSize <= 0 || pageSize > 1000)
            pageSize = 10;

        String orgId = SecurityUtils.getOrgId();
        if(SecurityUtils.getLoginUser().isSystem()){
            orgId = null;
        }

        //JwtUserDto userDto = userService.getCurrentUser();
        //String orgId = userService.isSystemUser(userDto.getRoleId()) ? null : userDto.getOrgId();

        Page<ProjectDto> pageRows = projectService.page(orgId, PageRequest.of(pageIndex-1, pageSize));

        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(pageRows.getContent());
        rspData.setTotal(pageRows.getTotalElements());
        return rspData;
    }
}
