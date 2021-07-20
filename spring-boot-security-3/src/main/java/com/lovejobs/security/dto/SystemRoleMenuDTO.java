package com.lovejobs.security.dto;

import java.io.Serializable;

/**
 * @author fengxin
 * @version 1.0
 * @description: TODO
 * @date 2021/7/20 11:20
 */
public class SystemRoleMenuDTO implements Serializable {
    private static final long serialVersionUID = -7441947099333694720L;

    private String roleCode;
    private String roleName;
    private String menuName;
    private String menuPath;
    private String menuUrl;

    public SystemRoleMenuDTO(String roleCode, String roleName, String menuName, String menuPath, String menuUrl) {
        this.roleCode = roleCode;
        this.roleName = roleName;
        this.menuName = menuName;
        this.menuPath = menuPath;
        this.menuUrl = menuUrl;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuPath() {
        return menuPath;
    }

    public void setMenuPath(String menuPath) {
        this.menuPath = menuPath;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }
}
