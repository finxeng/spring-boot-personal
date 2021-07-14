package com.lovejobs.enums;

public enum ErrorCode {
    /**
     *
     */
    SUCCESS(200, "success"),
    E_INVALID_PARAM(400, "param invalid"),
    E_TOKEN_EXPIRED(401, "token expired"),
    E_USER_NOT_FOUND(402, "user not found"),
    E_SWAP_LOGIN(403, "swap login"),
    E_HYSTRIX_FALLBACK(404, "hystrix fallback"),
    E_AUTH_EXCEPTION(410, "auth exception"),
    E_RESULT_NULL(800, "result null"),
    E_RESULT_NOT_NULL(801, "result not null"),
    E_SYSTEM(500, "service is unavailable"),
    E_RESULT_UPDATE_FAIL(805, "update db fail"),
    E_PARTNER_ERROR(501, "partner interface error"),
    E_ALTBALAJI_DRM_ERROR(502, "altbalaji error drm type"),
    S_ITEM_OFFLINE(201, "item has been offline"),
    S_ITEM_NOT_EXIST(204, "item not exist"),
    E_DRM_DECRYPT(20601, "drm decrypt"),
    E_AUTH_SERVICE_TOKEN_EXPIRE(20200, "token expired"),
    E_AUTH_SERVICE_TOKEN_NOT_VALID(20201, "token not valid"),
    E_DRM_NO_PERMISSION(20605, "drm no permission"),
    E_PARTNER_EXCEPTION_CODE(503, "partner interface business exception"),
    E_SUBSCRIPTION_FOLLOW_FREQUENT(10024, "follow frequently"),
    E_ILLEGAL_REQUEST(10201, "ILLEGAL APP"),
    E_SEARCH_UNAVAILABLE(20901, "search service unavailable"),
    MCP_CONFIG_ALREADY_EXIST(23001, "config already exist"),
    MCP_CONFIG_NOT_EXIST(23002, "config does not exist"),
    /**
     * A general description of the existing resource,
     * the specific resource type depends on the usage scenario
     */
    E_RESOURCE_ALREADY_EXIST(24001, "resource already exist");

    private int code;
    private String msg;

    ErrorCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
