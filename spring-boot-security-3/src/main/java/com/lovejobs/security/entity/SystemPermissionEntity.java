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
@Entity(name = "permission")
public class SystemPermissionEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;
    @JsonProperty("menu_id")
    private Long menuId;
    @JsonProperty("url")
    private String url;
    @JsonProperty("status")
    private Boolean status;
    @JsonProperty("anonymous")
    private Boolean anonymous;
    @JsonProperty("create_user")
    private String createUser;
    @JsonProperty("update_user")
    private String updateUser;
    @JsonProperty("create_time")
    private Date createTime;
    @JsonProperty("update_time")
    private Date updateTime;
}
