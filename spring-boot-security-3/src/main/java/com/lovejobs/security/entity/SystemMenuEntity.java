package com.lovejobs.security.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;


@Data
@Entity(name = "menu")
public class SystemMenuEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;
    @JsonProperty("menu_name")
    private String menuName;
    @JsonProperty("parent_id")
    private Long parentId;
    @JsonProperty("menu_url")
    private String menuUrl;
    @JsonProperty("menu_path")
    private String menuPath;
    @JsonProperty("status")
    private Boolean status;
    @JsonProperty("create_user")
    private String createUser;
    @JsonProperty("update_user")
    private String updateUser;
    @JsonProperty("create_time")
    private Date createTime;
    @JsonProperty("update_time")
    private Date updateTime;
}
