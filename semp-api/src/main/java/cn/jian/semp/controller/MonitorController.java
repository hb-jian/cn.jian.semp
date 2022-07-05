package cn.jian.semp.controller;

import cn.jian.semp.model.JsonResponse;
import io.swagger.annotations.Api;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.http.HttpEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//import cn.jian.semp.semp1.service.IStatisticsService;

/**
 * 系统监控接口
 * 1、当前项目运行情况：项目、负载
 */
@Api(tags = "系统监控")
@RequestMapping("/api/monitor")
@RestController
public class MonitorController {
//    @Autowired
//    private IStatisticsService statisticsServiceImpl;

    /**
     * 项目负载
     * @return
     */
    @Operation(summary = "查询项目负载")
    @GetMapping("/project/load")
    public HttpEntity<Object> load(){

        return JsonResponse.success();
    }
}
