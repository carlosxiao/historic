package com.cc.historic.system.dao;

import com.cc.historic.system.model.Role;
import com.cc.historic.system.model.RolePage;
import com.cc.historic.system.vo.RoleVO;

import java.util.List;

public interface RoleMapper {

    int deleteByPrimaryKey(String id);

    int insert(Role record);

    Role selectByPrimaryKey(String id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);

    List<Role> findTByPage(RolePage role);

    int findTCountByT(RolePage role);

    void deleteBy(String[] id);

    RoleVO selectRoleVOByPrimaryKey(String id);

}