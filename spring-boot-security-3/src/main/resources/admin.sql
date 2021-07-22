create table if not exists menu
(
    `id` bigint(20) unsigned auto_increment comment '自增id',
    `menu_name` varchar(255) default '' not null comment '菜单名称',
    `parent_id` bigint(20) unsigned default 0 not null comment '父类id',
    `menu_url` varchar(255) default '' not null,
    `menu_path` varchar(255) default '' not null,
    `status` tinyint(1) default 1 not null comment '是否启用 1 启用，0 禁用',
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
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '菜单信息表';


create table if not exists role_permission  (
    `id` bigint(20) unsigned auto_increment comment '自增id',
    `role_id` bigint(20) unsigned not null comment '角色id',
    `permission_id` bigint(20) unsigned not null comment '权限id',
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
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '机构信息表';

create table if not exists role
(
    `id` bigint(20) unsigned auto_increment comment '自增id',
    `role_code` varchar(255) default '' not null comment '角色编码',
    `role_name` varchar(255) default '' not null comment '角色名',
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '角色信息表';

create table if not exists role_menu
(
    `id` bigint(20) unsigned auto_increment comment '自增id',
    `role_id` bigint(20) unsigned not null comment '角色id',
    `menu_id` bigint(20) unsigned not null comment '菜单id',
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
    `user_enabled` tinyint(1) default 1 not null comment '是否启用： 1启用，0不启用',
    `create_time` datetime default CURRENT_TIMESTAMP null comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间',
    PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '登陆用户信息表';

create table if not exists user_organization
(
    id bigint(20) unsigned auto_increment comment '自增id' primary key,
    user_id bigint(20) unsigned not null comment '用户id',
    org_id bigint(20) unsigned not null comment '机构id',
    create_time datetime default CURRENT_TIMESTAMP null comment '创建时间',
    update_time datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '用户机构关系表';

create table if not exists user_role
(
    id bigint(20) unsigned auto_increment comment '自增id' primary key,
    user_id bigint(20) unsigned not null comment '用户id',
    role_id bigint(20) unsigned not null comment '角色id',
    create_time datetime default CURRENT_TIMESTAMP null comment '创建时间',
    update_time datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '修改时间'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '用户角色关系表';


INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (24, '系统配置', 0, null, '/system', 1, '2021-07-16 11:48:32', '2021-07-16 11:49:06');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (25, '用户管理', 24, '/user', '/system', 1, '2021-07-16 11:48:32', '2021-07-16 14:28:14');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (26, '角色配置', 24, '/role', '/system', 1, '2021-07-16 11:48:32', '2021-07-16 14:28:14');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (27, '菜单管理', 24, '/menu', '/system', 1, '2021-07-16 11:48:32', '2021-07-16 14:28:14');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (28, '通用配置', 0, null, '/common', 1, '2021-07-16 11:48:32', '2021-07-16 11:49:06');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (29, '供应商管理', 28, '/index', '/common', 1, '2021-07-16 11:49:52', '2021-07-16 14:28:14');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (30, '域名管理', 28, '/domain', '/common', 1, '2021-07-16 11:49:52', '2021-07-16 14:28:14');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (31, 'MCP调度管理', 0, null, '/mcp', 1, '2021-07-16 11:50:38', '2021-07-16 11:50:38');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (32, 'MCP调度业务方管理', 31, '/business', '/mcp', 1, '2021-07-16 11:51:19', '2021-07-16 14:28:14');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (33, 'MCP调度策略', 31, '/strategy', '/mcp', 1, '2021-07-16 11:51:39', '2021-07-16 14:28:14');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (34, 'NS管理', 0, null, '/ns', 1, '2021-07-16 11:52:51', '2021-07-16 11:52:51');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (35, 'NS配置项', 34, '/map', '/ns', 1, '2021-07-16 11:53:59', '2021-07-16 14:28:54');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (36, 'NS策略', 34, '/config', '/ns', 1, '2021-07-16 11:53:59', '2021-07-16 14:28:54');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (37, 'NS故障转移', 34, '/failover', '/ns', 1, '2021-07-16 11:54:33', '2021-07-16 14:28:54');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (38, 'Route53设置', 34, '/record', '/ns', 1, '2021-07-16 11:55:06', '2021-07-16 14:28:54');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (39, 'ABTest统计', 0, '/index', '/abtest', 1, '2021-07-16 11:55:45', '2021-07-16 11:55:45');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (40, '数据统计', 0, null, '/statistics', 1, '2021-07-16 11:56:12', '2021-07-16 11:56:12');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (41, '每日厂商统计', 40, '/cdn', '/statistics', 1, '2021-07-16 11:56:35', '2021-07-16 14:28:54');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (42, '每日域名统计', 40, '/domain', '/statistics', 1, '2021-07-16 11:56:57', '2021-07-16 14:28:54');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (43, '每日统计', 40, '/daily', '/statistics', 1, '2021-07-16 11:57:21', '2021-07-16 14:28:54');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (44, '实时域名统计', 40, '/realtimeDomain', '/statistics', 1, '2021-07-16 11:58:19', '2021-07-16 14:28:54');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (45, '每日部门统计', 40, '/group', '/statistics', 1, '2021-07-16 11:58:49', '2021-07-16 14:28:54');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (46, '每日国家统计', 40, '/country', '/statistics', 1, '2021-07-16 11:59:11', '2021-07-16 14:28:54');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (47, '操作日志', 0, '/index', '/logs', 1, '2021-07-16 11:59:53', '2021-07-16 11:59:53');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (48, '报警', 0, null, '/alarm', 1, '2021-07-16 12:00:57', '2021-07-16 12:00:57');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (49, '报警规则管理', 48, '/rules', '/alarm', 1, '2021-07-16 12:00:57', '2021-07-16 14:28:54');
INSERT INTO `spring-boot-security`.menu (id, menu_name, parent_id, menu_url, menu_path, enabled, create_time, update_time) VALUES (50, '报警日志', 48, '/logs', '/alarm', 1, '2021-07-16 12:00:57', '2021-07-16 14:28:54');


INSERT INTO `spring-boot-security`.organization (id, parent_id, org_code, org_name, create_time, update_time) VALUES (1, 0, 'SHAREit', '茄子快传', '2021-07-16 11:43:10', '2021-07-16 11:43:10');

INSERT INTO `spring-boot-security`.role (id, role_code, role_name, create_time, update_time) VALUES (1, 'ADMIN', '管理员', '2021-07-16 14:12:05', '2021-07-16 14:12:05');
INSERT INTO `spring-boot-security`.role (id, role_code, role_name, create_time, update_time) VALUES (2, 'USER', '普通用户', '2021-07-16 14:12:05', '2021-07-16 14:12:05');

INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (1, 1, 24, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (2, 1, 24, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (3, 1, 25, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (4, 1, 26, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (5, 1, 27, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (6, 1, 28, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (7, 1, 29, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (8, 1, 30, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (9, 1, 31, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (10, 1, 32, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (11, 1, 33, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (12, 1, 34, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (13, 1, 35, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (14, 1, 36, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (15, 1, 37, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (16, 1, 38, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (17, 1, 39, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (18, 1, 40, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (19, 1, 41, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (20, 1, 42, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (21, 1, 43, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (22, 1, 44, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (23, 1, 45, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (24, 1, 46, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (25, 1, 47, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (26, 1, 48, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (27, 1, 49, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (28, 1, 50, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (29, 2, 28, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (30, 2, 29, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (31, 2, 30, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (32, 2, 31, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (33, 2, 32, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (34, 2, 33, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (35, 2, 34, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (36, 2, 35, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (37, 2, 36, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (38, 2, 37, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (39, 2, 38, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (40, 2, 39, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (41, 2, 40, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (42, 2, 41, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (43, 2, 42, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (44, 2, 43, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (45, 2, 44, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (46, 2, 45, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (47, 2, 46, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (48, 2, 47, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (49, 2, 48, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (50, 2, 49, '2021-07-16 14:36:42', '2021-07-16 14:36:42');
INSERT INTO `spring-boot-security`.role_menu (id, role_id, menu_id, create_time, update_time) VALUES (51, 2, 50, '2021-07-16 14:36:42', '2021-07-16 14:36:42');

INSERT INTO `spring-boot-security`.user (id, user_name, user_pwd, user_email, user_enabled, create_time, update_time) VALUES (1, 'fengxin', 'fengxin', 'fengxin@ushareit.com', 1, '2021-07-16 11:25:00', '2021-07-16 11:25:00');
INSERT INTO `spring-boot-security`.user (id, user_name, user_pwd, user_email, user_enabled, create_time, update_time) VALUES (2, 'fengxin2', 'fengxin2', 'fengxin2@ushareit.com', 0, '2021-07-16 14:34:00', '2021-07-16 15:40:06');

INSERT INTO `spring-boot-security`.user_organization (id, user_id, org_id, create_time, update_time) VALUES (1, 1, 1, '2021-07-16 11:43:23', '2021-07-16 11:43:23');
INSERT INTO `spring-boot-security`.user_organization (id, user_id, org_id, create_time, update_time) VALUES (2, 2, 1, '2021-07-16 14:34:20', '2021-07-16 14:34:20');


INSERT INTO `spring-boot-security`.user_role (id, user_id, role_id, create_time, update_time) VALUES (1, 1, 1, '2021-07-16 14:33:37', '2021-07-16 14:33:37');
INSERT INTO `spring-boot-security`.user_role (id, user_id, role_id, create_time, update_time) VALUES (2, 2, 2, '2021-07-16 14:34:09', '2021-07-16 14:34:09');