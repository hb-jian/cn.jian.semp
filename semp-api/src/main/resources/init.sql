-- ----------------------------
-- 1、项目表
-- ----------------------------
DROP TABLE IF EXISTS `e_project`;
CREATE TABLE `e_project` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT null COMMENT '创建者',
  `updated` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(32) DEFAULT null COMMENT '更新者',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `description` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `capacity` bigint DEFAULT '0' COMMENT '装机容量',
  `cls_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'KepServer组件编号',
  `completion_date` date DEFAULT NULL COMMENT '竣工时间',
  `config` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '设备配置',
  `coverage` bigint DEFAULT '0' COMMENT '覆盖面积',
  `designs` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '工艺图',
  `opc_server_config` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Opc连接配置',
  `org_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机构编号',
  `time_to_market` date DEFAULT NULL COMMENT '投产时间',
  `building_type` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '建筑类型',
  `energy_type` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '能源类型',
  `location` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '项目位置',
  `data_source_type` varchar(16) default null comment '数据源类型',
  `data_source_config` varchar(1024) default null comment '数据源配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- 2、设备表
-- ----------------------------
DROP TABLE IF EXISTS `e_device`;
CREATE TABLE `e_device` (
  `id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT null COMMENT '创建者',
  `updated` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(32) DEFAULT null COMMENT '更新者',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `description` varchar(2000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `project_id` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '机构编号',
  `opc_items` varchar(2000) COLLATE utf8mb4_bin NOT NULL COMMENT '设备采集数据项',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


-- 初始化管理员用户admin/Hqry@2021
--insert into user(id,created,deleted,description,name,updated,account,enabled,last_login_time,org_id,password,role_id,last_login_ip);
insert into user(id,created,updated,deleted,description,name,account,enabled,last_login_ip,last_login_time,org_id,password,role_id) values('c2c9aebe528f11ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'admin','admin',1,null,null,'-1','546faaf7013477615923343f5b55aa2c','0');

-- 初始化系统管理员角色
-- insert into role(id,created,deleted,description,name,updated,enabled,org_id);
insert into role(id,created,updated,deleted,description,name,default_flag,enabled,org_id,type) values('0','1970-01-01 00:00:00','1970-01-01 00:00:00',0,'系统管理员默认角色','系统管理员',1,1,'-1','system');

-- 后台菜单
-- insert into menu(id,created,deleted,description,name,updated,parent_id,route,sort);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('f466f086a39011ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'首页','-1','dashboard',1.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('fbdaa267a39011ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'企业管理','-1','enterprise',2.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('ff46ef18a39011ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'企业列表','fbdaa267a39011ec8b8852540084f6e1','enterprise.list',1.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('02bf71daa39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'项目管理','-1','project',3.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('05c03fcea39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'项目列表','02bf71daa39111ec8b8852540084f6e1','project.list',1.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('091733d6a39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'用户管理','-1','user',4.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('0ca0bf3ea39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'用户列表','091733d6a39111ec8b8852540084f6e1','user.list',1.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('0fe4b1b0a39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'用户角色','091733d6a39111ec8b8852540084f6e1','user.role',2.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('13906694a39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'指挥中心','-1','command',5.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('16d84233a39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'数字大屏','13906694a39111ec8b8852540084f6e1','command.digitallargescreen',1.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('1a0546b0a39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'监控中心','13906694a39111ec8b8852540084f6e1','command.monitoring',2.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('1d240e80a39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'数据分析','-1','statistics',6.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('1ffe6430a39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'统计报表','1d240e80a39111ec8b8852540084f6e1','statistics.performance',1.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('230b10aaa39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'运营监控','-1','operate',7.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('268f2c15a39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'监控告警','230b10aaa39111ec8b8852540084f6e1','operate.alarm',1.0,0);
insert into menu(id,created,updated,deleted,description,name,parent_id,route,sort,system_flag) values('297add4fa39111ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'告警策略','230b10aaa39111ec8b8852540084f6e1','operate.policy',2.0,0);

-- 初始化默认角色权限菜单权限
-- insert into role_menu(id,created,deleted,description,name,updated,role_id,menu_id,role_id);
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('1df39367a39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','f466f086a39011ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('27c3e939a39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','fbdaa267a39011ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('2ba85e81a39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','ff46ef18a39011ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('3c52a0dca39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','02bf71daa39111ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('3fcb986ca39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','05c03fcea39111ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('42bc1406a39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','091733d6a39111ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('45ada496a39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','0ca0bf3ea39111ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('49afabbca39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','0fe4b1b0a39111ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('4d813f90a39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','13906694a39111ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('50468ea3a39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','16d84233a39111ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('53bb643da39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','1a0546b0a39111ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('56e02910a39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','1d240e80a39111ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('5a099fbda39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','1ffe6430a39111ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('5d217f8ca39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','230b10aaa39111ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('60afca1da39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','268f2c15a39111ec8b8852540084f6e1','0');
insert into role_menu(id,created,updated,deleted,description,name,menu_id,role_id) values('637904d6a39211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','297add4fa39111ec8b8852540084f6e1','0');


-- 初始化数据操作权限字典
insert into data_action(id,created,updated,deleted,description,name,data_type,method,method_name) values('b0f1a0f1735211ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'机构','organization','create|edit|query|delete','增加|修改|查询|删除');
insert into data_action(id,created,updated,deleted,description,name,data_type,method,method_name) values('75eccd96735311ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'项目','project','create|edit|query|delete','增加|修改|查询|删除');
insert into data_action(id,created,updated,deleted,description,name,data_type,method,method_name) values('8558675f735311ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'设备','device','create|edit|query|delete','增加|修改|查询|删除');
insert into data_action(id,created,updated,deleted,description,name,data_type,method,method_name) values('1a219488738f11ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'角色','role','create|edit|query|delete','增加|修改|查询|删除');
insert into data_action(id,created,updated,deleted,description,name,data_type,method,method_name) values('893a3624735311ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'用户','user','create|edit|query|delete','增加|修改|查询|删除');

-- 初始化默认角色数据操作权限
insert into role_data_action_mapping(id,created,updated,deleted,description,name,role_id,data_type,method) values('3057ce6e738f11ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','0','organization','*');
insert into role_data_action_mapping(id,created,updated,deleted,description,name,role_id,data_type,method) values('346c2a28738f11ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','0','project','*');
insert into role_data_action_mapping(id,created,updated,deleted,description,name,role_id,data_type,method) values('37c75883738f11ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','0','device','*');
insert into role_data_action_mapping(id,created,updated,deleted,description,name,role_id,data_type,method) values('3bc558f1738f11ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','0','role','*');
insert into role_data_action_mapping(id,created,updated,deleted,description,name,role_id,data_type,method) values('3f4759a6738f11ec8b8852540084f6e1','1970-01-01 00:00:00','1970-01-01 00:00:00',0,null,'','0','user','*');

insert into organization(id,name,created,updated,description,deleted)
values('171d497d566d11ec8b8852540084f6e1','华清荣益','1970-01-01 00:00:00','1970-01-01 00:00:00',null,0);

insert into project(id,name,created,updated,description,deleted,org_id,cls_id,coverage,capacity,config,completion_date,time_to_market,designs,opc_server_config)
values('20262225566d11ec8b8852540084f6e1','大北农园区','1970-01-01 00:00:00','1970-01-01 00:00:00',null,0,'171d497d566d11ec8b8852540084f6e1','7BC0CC8E-482C-47CA-ABDC-0FE7F9C6E729',102.1,10000,null,'2020-10-01','2020-12-01','http://www.baidu.com/a.jpg','{"host":"127.0.0.1","domain":"","user":"administrator","pwd":"Jyl13200@!","clsid":"7BC0CC8E-482C-47CA-ABDC-0FE7F9C6E729"}');

insert into device(id,name,created,updated,description,deleted,project_id)
values('2840e88e566d11ec8b8852540084f6e1','冷水机组1#','1970-01-01 00:00:00','1970-01-01 00:00:00',null,0,'20262225566d11ec8b8852540084f6e1');
insert into device(id,name,created,updated,description,deleted,project_id)
values('62c6aaceb94511ec8b8852540084f6e1','冷水机组2#','1970-01-01 00:00:00','1970-01-01 00:00:00',null,0,'20262225566d11ec8b8852540084f6e1');
insert into device(id,name,created,updated,description,deleted,project_id)
values('6a75ad31b94511ec8b8852540084f6e1','冷水机组3#','1970-01-01 00:00:00','1970-01-01 00:00:00',null,0,'20262225566d11ec8b8852540084f6e1');

-- insert into device_data_item(id,name,created,updated,description,deleted,device_id,item,item_type)
-- values('71eb8ade570011ec8b8852540084f6e1','累计耗电量','1970-01-01 00:00:00','1970-01-01 00:00:00',null,0,'2840e88e566d11ec8b8852540084f6e1','DB4.DBD600',0);
-- insert into device_data_item(id,name,created,updated,description,deleted,device_id,item,item_type)
-- values('18e8efec573b11ec8b8852540084f6e1','累计耗电量','1970-01-01 00:00:00','1970-01-01 00:00:00',null,0,'2840e88e566d11ec8b8852540084f6e1','DB4.DBD640',1);
-- insert into device_data_item(id,name,created,updated,description,deleted,device_id,item,item_type)
-- values('1e7972ca573b11ec8b8852540084f6e1','累计耗电量','1970-01-01 00:00:00','1970-01-01 00:00:00',null,0,'2840e88e566d11ec8b8852540084f6e1','DB4.DBD680',2);

