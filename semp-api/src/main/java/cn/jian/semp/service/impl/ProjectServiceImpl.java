package cn.jian.semp.service.impl;

import cn.jian.semp.entity.Project;
import cn.jian.semp.model.OrganizationDto;
import cn.jian.semp.model.ProjectDto;
import cn.jian.semp.repository.ProjectRepository;
import cn.jian.semp.service.IProjectService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

/**
 * 项目服务
 */
@Slf4j
@Service
public class ProjectServiceImpl implements IProjectService {
    @Autowired
    ProjectRepository projectRepository;
//    @Autowired
//    OrganizationServiceImpl organizationServiceImpl;

    @Override
    public ProjectDto get(String id) {
        Project project = projectRepository.findByIdAndDeletedIsFalse(id);
        if(project == null)
            throw new NoSuchElementException("记录不存在");
        return entityToModel(project);
    }

    @Override
    public Page<ProjectDto> page(String ownerId, Pageable pageable) {
        List<ProjectDto> proList = new ArrayList<>();

        Page<Project> projects = StringUtils.isEmpty(ownerId)?projectRepository.findAllByDeletedIsFalse(pageable) : projectRepository.findAllByOrgIdAndDeletedIsFalse(ownerId,pageable);
        projects.getContent().forEach(pro->proList.add(entityToModel(pro)));
        log.info("项目查询请求，orgid:{},index:{},size:{}，结果：{}",ownerId,pageable.getPageNumber(),pageable.getPageSize(),projects.getTotalElements());
        return new PageImpl<ProjectDto>(proList,projects.getPageable(),projects.getTotalElements());
    }

    @Override
    public Project create(ProjectDto data) {
        Project project = projectRepository.saveAndFlush(modelToEntity(data));
        return project;
    }

    @Override
    public void update(ProjectDto data) {
        projectRepository.saveAndFlush(modelToEntity(data));
    }

    @Override
    public void delete(List<String> ids) {
        projectRepository.deleteByIdInAndDeletedIsFalse(ids);
    }

    @Override
    public ProjectDto entityToModel(Project project) {
        OrganizationDto orgDto = new OrganizationDto();
        //OrganizationDto orgDto = organizationServiceImpl.get(project.getOrgId());

        ProjectDto proDto = new ProjectDto();
        proDto.setId(project.getId());
        proDto.setName(project.getName());
        proDto.setOrgId(project.getOrgId());
        proDto.setOrgName(orgDto.getName());
        proDto.setOpcConfig(project.getOpcServerConfig());
        proDto.setCoverage(project.getCoverage());
        proDto.setConfig(project.getConfig());
        proDto.setCapacity(project.getCapacity());
        proDto.setCompletionDate(project.getCompletionDate());
        proDto.setTimeToMarket(project.getTimeToMarket());

        proDto.setLocation(project.getLocation());
        proDto.setBuildingType(project.getBuildingType());
        proDto.setEnergyType(project.getEnergyType());

        proDto.setDataSourceType(project.getDataSourceType());
        proDto.setDataSourceConfig(project.getDataSourceConfig());
        return proDto;
    }

    @Override
    public Project modelToEntity(ProjectDto data) {
        Project project = new Project();
        if(StringUtils.isNotBlank(data.getId()))
            project.setId(data.getId());
        project.setName(data.getName());
        project.setOrgId(data.getOrgId());
        project.setClsId(data.getOpcConfig().getClsid());
        project.setCoverage(data.getCoverage());
        project.setOpcServerConfig(data.getOpcConfig());
        project.setConfig(data.getConfig());
        project.setCapacity(data.getCapacity());
        project.setCompletionDate(data.getCompletionDate());
        project.setTimeToMarket(data.getTimeToMarket());

        project.setLocation(data.getLocation());
        project.setBuildingType(data.getBuildingType());
        project.setEnergyType(data.getEnergyType());

        project.setDataSourceType(data.getDataSourceType());
        project.setDataSourceConfig(data.getDataSourceConfig());
        return project;
    }
}
