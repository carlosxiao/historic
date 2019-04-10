package com.cc.historic.admin.model;

import lombok.Data;

import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;

/**
 * 系统用户
 */
@Data
public class AdminUser implements Serializable {
    @Id
    private Integer id;

    private Integer tenantid;

    private String name;

    private String psw;

    private String email;

    private Integer creator;

    private Date createtime;

    private Integer flag;

    private Date logintime;

    private Integer updateuser;

    private Date updatetime;


}