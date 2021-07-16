SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `user_name` varchar(255) NOT NULL COMMENT '登录用户名',
    `user_pwd` varchar(255) NOT NULL COMMENT '登录密码',
    `user_email` varchar(255) NOT NULL COMMENT '邮箱地址',
    `user_enabled` smallint(1) NOT NULL DEFAULT 1 COMMENT '是否启用： 1启用，0不启用',
    `create_time` datetime default CURRENT_TIMESTAMP comment '创建时间',
    `update_time` datetime default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP comment '修改时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '登陆用户信息表';

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
     `id` int(11) AUTO_INCREMENT COMMENT '自增id',
     `menu_name` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单名称',
     `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父类id',
     `menu_url` varchar(255) DEFAULT NULL,
     `menu_path` varchar(255) DEFAULT NULL,
     `enabled` smallint(1) NOT NULL DEFAULT 1 COMMENT '是否启用 1 启用，0 禁用',
     `create_time` datetime default CURRENT_TIMESTAMP comment '创建时间',
     `update_time` datetime default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP comment '修改时间',
     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '机构信息表';

DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
     `id` int(11) AUTO_INCREMENT COMMENT '自增id',
     `parent_id` int(11) DEFAULT 0 COMMENT '父机构id',
     `org_code` varchar(255) NOT NULL DEFAULT '' COMMENT '机构编码',
     `org_name` varchar(255) NOT NULL DEFAULT '' COMMENT '机构名称',
     `create_time` datetime default CURRENT_TIMESTAMP comment '创建时间',
     `update_time` datetime default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP comment '修改时间',
     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '机构信息表';

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
     `id` int(11) AUTO_INCREMENT COMMENT '自增id',
     `role_code` varchar(255) NOT NULL DEFAULT '' COMMENT '角色编码',
     `role_name` varchar(255) NOT NULL DEFAULT '' COMMENT '角色名',
     `create_time` datetime default CURRENT_TIMESTAMP comment '创建时间',
     `update_time` datetime default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP comment '修改时间',
     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '角色信息表';

DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
      `id` int(11) AUTO_INCREMENT COMMENT '自增id',
      `role_id` int(11) NOT NULL COMMENT '角色id',
      `menu_id` int(11) NOT NULL COMMENT '菜单id',
      `create_time` datetime default CURRENT_TIMESTAMP comment '创建时间',
      `update_time` datetime default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP comment '修改时间',
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '角色菜单关系表';

DROP TABLE IF EXISTS `user_organization`;
CREATE TABLE `user_organization` (
      `id` int(11) AUTO_INCREMENT COMMENT '自增id',
      `user_id` int(11) NOT NULL COMMENT '用户id',
      `org_id` int(11) NOT NULL COMMENT '机构id',
      `create_time` datetime default CURRENT_TIMESTAMP comment '创建时间',
      `update_time` datetime default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP comment '修改时间',
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户结构关系表';

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
      `user_id` int(11) NOT NULL COMMENT '用户id',
      `role_id` int(11) NOT NULL COMMENT '角色id',
      `create_time` datetime default CURRENT_TIMESTAMP comment '创建时间',
      `update_time` datetime default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP comment '修改时间',
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户角色关系表';
