package com.lovejobs.utils;

import com.lovejobs.common.Result;
import com.lovejobs.enums.ErrorCode;


public class ResultUtil {
    /**
     * reponse success
     *
     * @param data
     * @return
     */
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

    /**
     * response success without data
     *
     * @return
     */
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

    /**
     * response fail
     *
     * @return
     */
    public static Result fail() {
        Result result = new Result();
        result.setResultCode(ErrorCode.E_SYSTEM.getCode());
        result.setData(null);
        return result;

    }

    /**
     * response fail
     *
     * @return
     */
    public static Result paramsInvalid() {
        Result result = new Result();
        result.setResultCode(ErrorCode.E_INVALID_PARAM.getCode());
        result.setData(null);
        return result;

    }

    /**
     * response fail
     *
     * @return
     */
    public static Result paramsInvalid(String msg) {
        Result result = new Result();
        result.setResultCode(ErrorCode.E_INVALID_PARAM.getCode());
        result.setMsg(msg);
        return result;

    }

    /**
     * resonse fail
     *
     * @return
     */
    public static Result failWithMsg(ErrorCode errorCode) {
        Result result = new Result();
        result.setResultCode(errorCode.getCode());
        result.setMsg(errorCode.getMsg());
        result.setData(null);
        return result;

    }
}
