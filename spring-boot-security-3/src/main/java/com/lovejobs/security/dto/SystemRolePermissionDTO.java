package com.lovejobs.security.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author fengxin
 * @version 1.0
 * @description: TODO
 * @date 2021/7/26 16:17
 */
@Data
public class SystemRolePermissionDTO implements Serializable {
    private static final long serialVersionUID = -4885544466283622112L;

    private String roleCode;
    private String roleName;
    private String url;


    public SystemRolePermissionDTO(String roleCode, String roleName, String url) {
        this.roleCode = roleCode;
        this.roleName = roleName;
        this.url = url;
    }
}
