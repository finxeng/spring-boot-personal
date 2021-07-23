create table if not exists menu
(
    `id` bigint(20) unsigned auto_increment comment '自增id',
    `menu_name` varchar(255) default '' not null comment '菜单名称',
    `parent_id` bigint(20) unsigned default 0 not null comment '父类id',
    `menu_url` varchar(255) default '' comment '菜单地址',
    `menu_path` varchar(255) default '' not null comment '菜单一级路径',
    `status` tinyint(1) default 1 not null comment '是否启用 1 启用，0 禁用',
    `create_user` varchar(32) default '' not null comment '创建人',
    `update_user` varchar(32) default '' not null comment '最后修改人',
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '菜单信息表';

create table if not exists permission
(
    `id` bigint(20) unsigned auto_increment comment '自增id',
    `menu_id` bigint(20) unsigned not null comment '菜单id',
    `url` varchar(255) not null,
    `status` tinyint(1) default 1 not null comment '是否启用 1 启用，0 禁用',
    `anonymous` tinyint(1) default 0 not null comment '登陆用户即可访问 1 无需授权登陆访问，0 需要授权角色才可以访问',
    `create_user` varchar(32) default '' not null comment '创建人',
    `update_user` varchar(32) default '' not null comment '最后修改人',
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '权限信息表';


create table if not exists role_permission  (
    `id` bigint(20) unsigned auto_increment comment '自增id',
    `role_id` bigint(20) unsigned not null comment '角色id',
    `permission_id` bigint(20) unsigned not null comment '权限id',
    `create_user` varchar(32) default '' not null comment '创建人',
    `update_user` varchar(32) default '' not null comment '最后修改人',
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '角色权限关系表';

create table if not exists organization
(
    `id` bigint(20) unsigned auto_increment comment '自增id',
    `parent_id` bigint(20) unsigned not null comment '父机构id',
    `org_code` varchar(255) default '' not null comment '机构编码',
    `org_name` varchar(255) default '' not null comment '机构名称',
    `status` tinyint(1) default 1 not null comment '是否启用 1 启用，0 禁用',
    `create_user` varchar(32) default '' not null comment '创建人',
    `update_user` varchar(32) default '' not null comment '最后修改人',
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '机构信息表';

create table if not exists role
(
    `id` bigint(20) unsigned auto_increment comment '自增id',
    `role_code` varchar(255) default '' not null comment '角色编码',
    `role_name` varchar(255) default '' not null comment '角色名',
    `create_user` varchar(32) default '' not null comment '创建人',
    `update_user` varchar(32) default '' not null comment '最后修改人',
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '角色信息表';

create table if not exists role_menu
(
    `id` bigint(20) unsigned auto_increment comment '自增id',
    `role_id` bigint(20) unsigned not null comment '角色id',
    `menu_id` bigint(20) unsigned not null comment '菜单id',
    `create_user` varchar(32) default '' not null comment '创建人',
    `update_user` varchar(32) default '' not null comment '最后修改人',
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '角色菜单关系表';

create table if not exists user
(
    `id` bigint(20) unsigned auto_increment comment '自增id',
    `user_name` varchar(255) not null comment '登录用户名',
    `user_pwd` varchar(255) not null comment '登录密码',
    `user_email` varchar(255) not null comment '邮箱地址',
    `status` tinyint(1) default 1 not null comment '用户状态： 1 启用，0 禁用',
    `create_user` varchar(32) default '' not null comment '创建人',
    `update_user` varchar(32) default '' not null comment '最后修改人',
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '登陆用户信息表';

create table if not exists user_organization
(
    `id` bigint(20) unsigned auto_increment comment '自增id' primary key,
    `user_id` bigint(20) unsigned not null comment '用户id',
    `org_id` bigint(20) unsigned not null comment '机构id',
    `create_user` varchar(32) default '' not null comment '创建人',
    `update_user` varchar(32) default '' not null comment '最后修改人',
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '用户机构关系表';

create table if not exists user_role
(
    `id` bigint(20) unsigned auto_increment comment '自增id' primary key,
    `user_id` bigint(20) unsigned not null comment '用户id',
    `role_id` bigint(20) unsigned not null comment '角色id',
    `create_user` varchar(32) default '' not null comment '创建人',
    `update_user` varchar(32) default '' not null comment '最后修改人',
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '用户角色关系表';

INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (1, '系统配置', 0, '', '/system', 1, 'fengxin', 'fengxin', '2021-07-16 11:48:32', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (2, '用户管理', 24, '/user', '/system', 1, 'fengxin', 'fengxin', '2021-07-16 11:48:32', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (3, '角色配置', 24, '/role', '/system', 1, 'fengxin', 'fengxin', '2021-07-16 11:48:32', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (4, '菜单管理', 24, '/menu', '/system', 1, 'fengxin', 'fengxin', '2021-07-16 11:48:32', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (5, '通用配置', 0, '', '/common', 1, 'fengxin', 'fengxin', '2021-07-16 11:48:32', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (6, '供应商管理', 28, '/index', '/common', 1, 'fengxin', 'fengxin', '2021-07-16 11:49:52', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (7, '域名管理', 28, '/domain', '/common', 1, 'fengxin', 'fengxin', '2021-07-16 11:49:52', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (8, 'MCP调度管理', 0, '', '/mcp', 1, 'fengxin', 'fengxin', '2021-07-16 11:50:38', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (9, 'MCP调度业务方管理', 31, '/business', '/mcp', 1, 'fengxin', 'fengxin', '2021-07-16 11:51:19', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (10, 'MCP调度策略', 31, '/strategy', '/mcp', 1, 'fengxin', 'fengxin', '2021-07-16 11:51:39', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (11, 'NS管理', 0, '', '/ns', 1, 'fengxin', 'fengxin', '2021-07-16 11:52:51', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (12, 'NS配置项', 34, '/map', '/ns', 1, 'fengxin', 'fengxin', '2021-07-16 11:53:59', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (13, 'NS策略', 34, '/config', '/ns', 1, 'fengxin', 'fengxin', '2021-07-16 11:53:59', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (14, 'NS故障转移', 34, '/failover', '/ns', 1, 'fengxin', 'fengxin', '2021-07-16 11:54:33', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (15, 'Route53设置', 34, '/record', '/ns', 1, 'fengxin', 'fengxin', '2021-07-16 11:55:06', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (16, 'ABTest统计', 0, '/index', '/abtest', 1, 'fengxin', 'fengxin', '2021-07-16 11:55:45', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (17, '数据统计', 0, '', '/statistics', 1, 'fengxin', 'fengxin', '2021-07-16 11:56:12', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (18, '每日厂商统计', 40, '/cdn', '/statistics', 1, 'fengxin', 'fengxin', '2021-07-16 11:56:35', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (19, '每日域名统计', 40, '/domain', '/statistics', 1, 'fengxin', 'fengxin', '2021-07-16 11:56:57', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (20, '每日统计', 40, '/daily', '/statistics', 1, 'fengxin', 'fengxin', '2021-07-16 11:57:21', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (21, '实时域名统计', 40, '/realtimeDomain', '/statistics', 1, 'fengxin', 'fengxin', '2021-07-16 11:58:19', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (22, '每日部门统计', 40, '/group', '/statistics', 1, 'fengxin', 'fengxin', '2021-07-16 11:58:49', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (23, '每日国家统计', 40, '/country', '/statistics', 1, 'fengxin', 'fengxin', '2021-07-16 11:59:11', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (24, '操作日志', 0, '/index', '/logs', 1, 'fengxin', 'fengxin', '2021-07-16 11:59:53', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (25, '报警', 0, '', '/alarm', 1, 'fengxin', 'fengxin', '2021-07-16 12:00:57', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (26, '报警规则管理', 48, '/rules', '/alarm', 1, 'fengxin', 'fengxin', '2021-07-16 12:00:57', '2021-07-23 16:58:09');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, status, create_user, update_user, create_time, update_time) VALUES (27, '报警日志', 48, '/logs', '/alarm', 1, 'fengxin', 'fengxin', '2021-07-16 12:00:57', '2021-07-23 16:58:09');

INSERT INTO `spring-boot-security`.organization (id, parent_id, org_code, org_name, status, create_user, update_user, create_time, update_time) VALUES (1, 0, 'SHAREit', '茄子快传', 1, 'fengxin', 'fengxin', '2021-07-16 11:43:10', '2021-07-23 16:58:22');

INSERT INTO `spring-boot-security`.permission (id, menu_id, url, status, anonymous, create_user, update_user, create_time, update_time) VALUES (1, 6, '/config/cdn_prov/list', 1, 0, 'fengxin', 'fengxin', '2021-07-23 17:04:09', '2021-07-23 17:05:42');
INSERT INTO `spring-boot-security`.permission (id, menu_id, url, status, anonymous, create_user, update_user, create_time, update_time) VALUES (2, 6, '/config/cdn_prov/mod', 1, 0, 'fengxin', 'fengxin', '2021-07-23 17:04:09', '2021-07-23 17:05:42');
INSERT INTO `spring-boot-security`.permission (id, menu_id, url, status, anonymous, create_user, update_user, create_time, update_time) VALUES (3, 6, '/config/cdn_prov/add', 1, 0, 'fengxin', 'fengxin', '2021-07-23 17:04:09', '2021-07-23 17:05:42');

INSERT INTO `spring-boot-security`.role (id, role_code, role_name, create_user, update_user, create_time, update_time) VALUES (1, 'ADMIN', '管理员', 'fengxin', 'fengxin', '2021-07-16 14:12:05', '2021-07-23 16:58:29');
INSERT INTO `spring-boot-security`.role (id, role_code, role_name, create_user, update_user, create_time, update_time) VALUES (2, 'USER', '普通用户', 'fengxin', 'fengxin', '2021-07-16 14:12:05', '2021-07-23 16:58:29');

INSERT INTO `spring-boot-security`.role_permission (id, role_id, permission_id, create_user, update_user, create_time, update_time) VALUES (1, 1, 1, 'fengxin', 'fengxin', '2021-07-23 17:06:06', '2021-07-23 17:06:10');
INSERT INTO `spring-boot-security`.role_permission (id, role_id, permission_id, create_user, update_user, create_time, update_time) VALUES (2, 1, 2, 'fengxin', 'fengxin', '2021-07-23 17:06:06', '2021-07-23 17:06:10');
INSERT INTO `spring-boot-security`.role_permission (id, role_id, permission_id, create_user, update_user, create_time, update_time) VALUES (3, 1, 3, 'fengxin', 'fengxin', '2021-07-23 17:06:06', '2021-07-23 17:06:10');
INSERT INTO `spring-boot-security`.role_permission (id, role_id, permission_id, create_user, update_user, create_time, update_time) VALUES (4, 2, 1, 'fengxin', 'fengxin', '2021-07-23 17:06:59', '2021-07-23 17:07:01');

INSERT INTO `spring-boot-security`.user (id, user_name, user_pwd, user_email, status, create_user, update_user, create_time, update_time) VALUES (1, 'fengxin', 'fengxin', 'fengxin@ushareit.com', 1, 'fengxin', 'fengxin', '2021-07-16 11:25:00', '2021-07-23 16:58:40');
INSERT INTO `spring-boot-security`.user (id, user_name, user_pwd, user_email, status, create_user, update_user, create_time, update_time) VALUES (2, 'fengxin2', 'fengxin2', 'fengxin2@ushareit.com', 0, 'fengxin', 'fengxin', '2021-07-16 14:34:00', '2021-07-23 16:58:40');

INSERT INTO `spring-boot-security`.user_organization (id, user_id, org_id, create_user, update_user, create_time, update_time) VALUES (1, 1, 1, 'fengxin', 'fengxin', '2021-07-16 11:43:23', '2021-07-23 16:58:45');
INSERT INTO `spring-boot-security`.user_organization (id, user_id, org_id, create_user, update_user, create_time, update_time) VALUES (2, 2, 1, 'fengxin', 'fengxin', '2021-07-16 14:34:20', '2021-07-23 16:58:45');

INSERT INTO `spring-boot-security`.user_role (id, user_id, role_id, create_user, update_user, create_time, update_time) VALUES (1, 1, 1, 'fengxin', 'fengxin', '2021-07-16 14:33:37', '2021-07-23 16:58:50');
INSERT INTO `spring-boot-security`.user_role (id, user_id, role_id, create_user, update_user, create_time, update_time) VALUES (2, 2, 2, 'fengxin', 'fengxin', '2021-07-16 14:34:09', '2021-07-23 16:58:50');

INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (1, 1, 1, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (2, 1, 2, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (3, 1, 3, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (4, 1, 4, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (5, 1, 5, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (6, 1, 6, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (7, 1, 7, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (8, 1, 8, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (9, 1, 9, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (10, 1, 10, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (11, 1, 11, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (12, 1, 12, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (13, 1, 13, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (14, 1, 14, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (15, 1, 15, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (16, 1, 16, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (17, 1, 17, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (18, 1, 18, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (19, 1, 19, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (20, 1, 20, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (21, 1, 21, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (22, 1, 22, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (23, 1, 23, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (24, 1, 24, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (25, 1, 25, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (26, 1, 26, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (27, 1, 27, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (28, 2, 5, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (29, 2, 6, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (30, 2, 7, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (31, 2, 8, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (32, 2, 9, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (33, 2, 10, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (34, 2, 11, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (35, 2, 12, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (36, 2, 13, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (37, 2, 14, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (38, 2, 15, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (39, 2, 16, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (40, 2, 17, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (41, 2, 18, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (42, 2, 19, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (43, 2, 20, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (44, 2, 21, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (45, 2, 22, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (46, 2, 23, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (47, 2, 24, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (48, 2, 25, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (49, 2, 26, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_user, update_user, create_time, update_time) VALUES (50, 2, 27, 'fengxin', 'fengxin', '2021-07-23 17:42:33', '2021-07-23 17:42:36');