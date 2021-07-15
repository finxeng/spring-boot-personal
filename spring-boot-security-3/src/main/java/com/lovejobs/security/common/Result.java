package com.lovejobs.security.common;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class Result<T> implements Serializable {

    private static final long serialVersionUID = -6245664732381565295L;
    @JsonProperty("result_code")
    @JSONField(name="result_code")
    private int resultCode;

    private Long timestamp;

    private String msg;

    private T data;

    public Result() {
        this.timestamp = System.currentTimeMillis();
    }

    public int getResultCode() {
        return resultCode;
    }

    public void setResultCode(int resultCode) {
        this.resultCode = resultCode;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Long timestamp) {
        this.timestamp = timestamp;
    }

}
