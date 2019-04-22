package com.cc.historic.common;

import java.io.Serializable;

/**
 * @author carlosxiao
 * @classname R
 */
public class R<T> implements Serializable {
    /**
     * 是否成功
     */
    private boolean success;

    /**
     * 承载数据
     */
    private T data;

    /**
     * 返回消息
     */
    private String msg;


    private R(boolean success, T data, String msg) {
        this.data = data;
        this.success = success;
        this.msg = msg;
    }

    private R(boolean success, T data) {
        this.data = data;
        this.success = success;
    }

    private R(boolean success, String msg) {
        this.msg = msg;
        this.success = success;
    }


    /**
     * 返回R
     *
     * @param data 数据
     * @param <T>  T 泛型标记
     * @return R
     */
    public static <T> R<T> success(T data) {
        return new R<>(true, data);
    }

    public static <T> R<T> fail(String msg) {
        return new R<>(false, msg);
    }


    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
