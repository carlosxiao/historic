package com.cc.historic.system.service;

import com.cc.historic.common.model.GetEasyUIData;
import com.cc.historic.system.model.*;
import com.cc.historic.system.vo.RoleVO;

import java.util.List;

public interface RoleService {

    void insertRole(RoleAddModel role);

    void updateRole(RoleAddModel role);

    void deleteRole(String[] id);

    GetEasyUIData findTByPage(RolePage role);

    RoleVO selectByPrimaryKey(String id);

    List<Role> selectAll();

    void deleteByT(RoleResources[] r);

    List<Resources> findResourcesByT(Resources resources);

}
