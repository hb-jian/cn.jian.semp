package cn.jian.semp.service.impl;//package cn.jian.semp.semp1.service.impl;
//
//import cn.jian.semp.semp1.entity.Organization;
//import cn.jian.semp.semp1.entity.Role;
//import cn.jian.semp.semp1.model.MenuDto;
//import cn.jian.semp.semp1.model.OrganizationDto;
//import cn.jian.semp.semp1.model.RoleTypeEnum;
//import cn.jian.semp.semp1.model.UserRoleDto;
//import cn.jian.semp.semp1.model.api.OrganizationCreateOrUpdateReq;
//import cn.jian.semp.semp1.model.api.RegisterReq;
//import cn.jian.semp.semp1.repository.OrganizationRepository;
//import cn.jian.semp.semp1.service.ICrudService;
//import cn.jian.semp.semp1.service.IUserRoleService;
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageImpl;
//import org.springframework.data.domain.Pageable;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.NoSuchElementException;
//
///**
// * 项目服务
// */
//@Service
//public class OrganizationServiceImpl implements ICrudService<Organization, OrganizationDto> {
//    @Autowired
//    OrganizationRepository organizationRepository;
//    @Autowired
//    IUserService userService;
//    @Autowired
//    IUserRoleService userRoleService;
//
//    @Override
//    public OrganizationDto get(String id) {
//        Organization org = organizationRepository.findByIdAndDeletedIsFalse(id);
//        if(org == null)
//            throw new NoSuchElementException("记录不存在");
//        return entityToModel(org);
//    }
//
//    @Override
//    public Page<OrganizationDto> page(String ownerId, Pageable pageable) {
//        List<OrganizationDto> proList = new ArrayList<>();
//
//        Page<Organization> orgs = organizationRepository.findAllByDeletedIsFalse(pageable);
//        orgs.getContent().forEach(org-> proList.add(entityToModel(org)));
//
//        return new PageImpl<OrganizationDto>(proList,orgs.getPageable(),orgs.getTotalElements());
//    }
//
//    /**
//     * 创建机构，并分配默认角色和管理员
//     * @param data
//     */
//    @Override
//    @Transactional
//    public Organization create(OrganizationDto data) {
//        OrganizationCreateOrUpdateReq createOrUpdateReq = (OrganizationCreateOrUpdateReq)data;
//
//        Organization newOrg = modelToEntity(data);
//        //创建企业记录
//        organizationRepository.saveAndFlush(modelToEntity(data));
//        //生成企业角色
//        UserRoleDto orgDefaultRole = new UserRoleDto();
//        orgDefaultRole.setOrgId(newOrg.getId());
//        orgDefaultRole.setName("默认角色");
//        orgDefaultRole.setRoleType(RoleTypeEnum.org);
//        orgDefaultRole.setDefaultFlag(true);
//        orgDefaultRole.setMenus(data.getMenus());
//        Role role = userRoleService.create(orgDefaultRole);
//
//        //创建企业管理员
//        RegisterReq registerReq = new RegisterReq();
//        registerReq.setAccount(createOrUpdateReq.getAdmin());
//        registerReq.setName(data.getName());
//        registerReq.setPwd(createOrUpdateReq.getPwd());
//        registerReq.setOrgId(newOrg.getId());
//        registerReq.setRoleId(role.getId());
//        userService.register(registerReq);
//
//        return newOrg;
//    }
//
//    @Override
//    public void update(OrganizationDto data) {
//        //更新机构信息
//        organizationRepository.saveAndFlush(modelToEntity(data));
//        //更新机构菜单
//        userRoleService.setOrgMenus(data.getId(),data.getMenus());
//    }
//
//    @Override
//    public void delete(List<String> ids) {
//        organizationRepository.deleteByIdInAndDeletedIsFalse(ids);
//    }
//
//    @Override
//    public OrganizationDto entityToModel(Organization org) {
//        OrganizationDto orgDto = new OrganizationDto();
//        orgDto.setId(org.getId());
//        orgDto.setName(org.getName());
//        orgDto.setDataViewUrlOfOrg(org.getDataViewUrlOfOrg());
//        orgDto.setDataViewUrlOfProject(org.getDataViewUrlOfProject());
//
//        //List<MenuDto> menus = userRoleService.getDefaultMenus(org.getId());
//        List<MenuDto> menus = userRoleService.getMenusWithUnchecked(org.getId());
//        orgDto.setMenus(menus);
//        return orgDto;
//    }
//
//    @Override
//    public Organization modelToEntity(OrganizationDto data) {
//        Organization org = new Organization();
//        org.setName(data.getName());
//        if(StringUtils.isNotBlank(data.getId())){
//            org.setId(data.getId());
//        }
//        org.setDataViewUrlOfOrg(data.getDataViewUrlOfOrg());
//        org.setDataViewUrlOfProject(data.getDataViewUrlOfProject());
//        return org;
//    }
//}
