package com.cc.historic.admin.service;



import com.cc.historic.admin.model.Role;

import java.util.List;

/**
 * 角色相关业务接口
 */
public interface RoleService {

    /**
     * 查询所有角色
     * @return
     */
    public List<Role> select(int page, int pageSize, String query);

    /**
     * 查询数据总数
     * @return
     */
    public int selectCount(String query);

    /**
     * 根据id查询角色
     * @param id
     * @return
     */
    public Role selectById(int id);

    /**
     * 添加一个角色
     * @param role
     * @return
     */
    public boolean insert(Role role);

    /**
     * 更新一个角色
     * @param role
     * @return
     */
    public boolean update(Role role);

    /**
     * 删除指定id的角色，可以是一个集合，用,分割
     * @param id
     * @return
     */
    public boolean delete(String id);

}
