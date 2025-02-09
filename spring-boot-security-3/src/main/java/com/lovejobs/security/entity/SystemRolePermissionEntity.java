package com.lovejobs.security.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

/**
 * @author fengxin
 * @version 1.0
 * @description: TODO
 * @date 2021/7/26 14:43
 */
@Data
@Entity(name = "role_permission")
public class SystemRolePermissionEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;
    @JsonProperty("role_id")
    private Long roleId;
    @JsonProperty("permission_id")
    private Long permissionId;
    @JsonProperty("create_user")
    private String createUser;
    @JsonProperty("update_user")
    private String updateUser;
    @JsonProperty("create_time")
    private Date createTime;
    @JsonProperty("update_time")
    private Date updateTime;
}
