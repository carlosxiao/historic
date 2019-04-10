package com.cc.historic.admin.model;

import lombok.Data;

import javax.persistence.Id;
import java.util.Date;

/**
 * 角色和菜单关联
 */
@Data
public class RoleMenu {
    @Id
    private Integer menuid;
    @Id
    private Integer roleid;

    private Integer flag;

    private Integer creator;

    private Date createtime;


}