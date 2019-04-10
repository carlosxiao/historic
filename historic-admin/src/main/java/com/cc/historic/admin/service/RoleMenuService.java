package com.cc.historic.admin.service;



import com.cc.historic.admin.model.Menu;

import java.util.List;

/**
 * 角色拥有菜单相关业务接口
 */
public interface RoleMenuService {

    /**
     * 查询角色的相关资源权限（菜单权限）
     * @param id
     * @return
     */
    List<Menu> selectByRoleId(int id);

    /**
     * 更新角色权限
     * @param ids
     * @return
     */
    boolean updateRoleMenu(String ids, int roleid, int userid);
}
