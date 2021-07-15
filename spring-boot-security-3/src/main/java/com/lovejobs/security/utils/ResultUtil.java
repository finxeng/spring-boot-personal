package com.lovejobs.security.utils;

import com.lovejobs.security.common.Result;
import com.lovejobs.security.enums.ErrorCode;

public class ResultUtil {

    public static Result ok(Object data) {
        Result result = new Result();
        result.setResultCode(ErrorCode.SUCCESS.getCode());
        result.setData(data);
        return result;

    }

    public static <T> Result<T> success(T data) {
        Result<T> result = new Result<>();
        result.setResultCode(ErrorCode.SUCCESS.getCode());
        result.setData(data);
        return result;
    }


    public static Result ok() {
        Result result = new Result();
        result.setResultCode(ErrorCode.SUCCESS.getCode());
        return result;

    }

    public static Result result(Integer code){
        Result result = new Result();
        result.setResultCode(code);
        result.setData(null);
        return result;
    }

    public static Result fail() {
        Result result = new Result();
        result.setResultCode(ErrorCode.E_SYSTEM.getCode());
        result.setData(null);
        return result;

    }

    public static Result paramsInvalid() {
        Result result = new Result();
        result.setResultCode(ErrorCode.E_INVALID_PARAM.getCode());
        result.setData(null);
        return result;

    }

    public static Result paramsInvalid(String msg) {
        Result result = new Result();
        result.setResultCode(ErrorCode.E_INVALID_PARAM.getCode());
        result.setMsg(msg);
        return result;

    }

    public static Result failWithMsg(ErrorCode errorCode) {
        Result result = new Result();
        result.setResultCode(errorCode.getCode());
        result.setMsg(errorCode.getMsg());
        result.setData(null);
        return result;

    }
}
