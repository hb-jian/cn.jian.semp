package cn.jian.semp.controller;


import cn.jian.semp.model.DeviceDto;
import cn.jian.semp.model.DeviceStatusDto;
import cn.jian.semp.model.api.DeviceCreateOrUpdateReq;
import cn.jian.semp.service.IDeviceService;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;
import java.util.Arrays;
import java.util.List;

/**
 * 设备管理接口
 */
@Api(tags = "设备管理")
@RequestMapping("/energy/device")
@RestController
public class DeviceController {
    @Autowired
    IDeviceService deviceService;

    /**
     * 新建
     * @param createReq
     * @return
     */
    @Operation(summary = "登记")
    @PostMapping("/create")
    @ApiImplicitParams({
            @ApiImplicitParam(name="Authorization",value = "授权信息",paramType = "Header",required = true)
    })
    public AjaxResult create(@RequestBody DeviceCreateOrUpdateReq createReq){
        deviceService.create(createReq);
        return AjaxResult.success();
    }

    /**
     * 修改
     * @param updateReq
     * @return
     */
    @Operation(summary = "更新")
    @PostMapping("/update")
    @ApiImplicitParams({
            @ApiImplicitParam(name="Authorization",value = "授权信息",paramType = "Header",required = true)
    })
    public AjaxResult update(@RequestBody DeviceCreateOrUpdateReq updateReq){
        deviceService.update(updateReq);
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
            @ApiImplicitParam(name="Authorization",value = "授权信息",paramType = "Header",required = true),
            @ApiImplicitParam(name="id",value = "设备编号",paramType = "path",required = true)
    })
    public AjaxResult get(@PathVariable String id){
        DeviceDto deviceDto = deviceService.get(id);

        return AjaxResult.success(deviceDto);
    }

    /**
     * 结构列表
     * @param pageIndex
     * @return
     */
    @Operation(summary = "分页列表")
    @GetMapping("/list")
    @ApiImplicitParams({
//            @ApiImplicitParam(name="Authorization",value = "授权信息",paramType = "Header",required = true),
            @ApiImplicitParam(name="proId",value = "项目编号",paramType = "query"),
            @ApiImplicitParam(name="orgId",value = "机构编号",paramType = "query"),
            @ApiImplicitParam(name="pageNum",value = "分页序号",paramType = "query",defaultValue = "0"),
            @ApiImplicitParam(name="pageSize",value = "分页数量",paramType = "query",defaultValue = "10")
    })
    public TableDataInfo list(
            @RequestParam(name = "proId",required = false) String projectId,
            @RequestParam(name = "orgId",required = false) String orgId,
            @RequestParam(name = "pageNum",required = false,defaultValue = "0") Integer pageIndex,
            @RequestParam(name = "pageSize",required = false,defaultValue = "10") Integer pageSize) {
        if (pageIndex == null || pageIndex <= 1)
            pageIndex = 1;

        if (pageSize == null || pageSize <= 0 || pageSize > 1000)
            pageSize = 10;

        //非管理员用户，仅允许查询当前所属机构下数据
        if (!SecurityUtils.getLoginUser().isSystem()) {
            orgId = SecurityUtils.getOrgId();
        }

        Page<DeviceDto> pageRows = null;
        //优先使用项目编号进行查询
        if (StringUtils.isNotEmpty(projectId)) {
            pageRows = deviceService.getByProject(projectId, PageRequest.of(pageIndex - 1, pageSize));
        } else {
            pageRows = deviceService.getByOrg(orgId, PageRequest.of(pageIndex - 1, pageSize));
        }

        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        if (pageRows != null) {
            rspData.setRows(pageRows.getContent());
            rspData.setTotal(pageRows.getTotalElements());
        }
        return rspData;
    }

    /**
     * 索取设备状态
     */
    @Operation(summary = "获取设备状态")
    @GetMapping("/status")
    @ApiImplicitParams({
            @ApiImplicitParam(name="Authorization",value = "授权信息",paramType = "Header",required = true),
            @ApiImplicitParam(name="deviceIds",value = "设备编号集合，多个设备使用逗号分隔",paramType = "query",example = "1,2,3,4",required = true)
    })
    public AjaxResult status(String deviceIds){
        if(StringUtils.isBlank(deviceIds))
            return AjaxResult.success();

        String[] idArr = StringUtils.split(deviceIds,",");

        List<DeviceStatusDto> statusList = deviceService.getStatus(Arrays.asList(idArr));
        return AjaxResult.success(statusList);
    }

}
