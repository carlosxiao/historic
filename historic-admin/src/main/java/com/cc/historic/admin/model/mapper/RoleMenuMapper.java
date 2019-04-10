package com.cc.historic.admin.model.mapper;

import com.cc.historic.admin.model.RoleMenu;
import org.apache.ibatis.annotations.Delete;
import tk.mybatis.mapper.common.Mapper;

public interface RoleMenuMapper extends Mapper<RoleMenu> {

    @Delete({
            "delete from role_menu",
            "where roleid = #{roleid}"
    })
    int deleteByRoleid(String roleid);




}