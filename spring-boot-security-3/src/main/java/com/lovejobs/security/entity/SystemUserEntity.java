package com.lovejobs.security.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;


@Data
@Entity(name = "user")
public class SystemUserEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;
    @JsonProperty("user_name")
    private String userName;
    @JsonProperty("user_pwd")
    private String userPwd;
    @JsonProperty("user_email")
    private String userEmail;
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
