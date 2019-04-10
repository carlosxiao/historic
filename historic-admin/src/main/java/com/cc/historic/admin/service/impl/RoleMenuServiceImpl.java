package com.cc.historic.admin.service.impl;

import com.cc.historic.admin.model.Menu;
import com.cc.historic.admin.model.mapper.MenuMapper;
import com.cc.historic.admin.service.RoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 角色相关权限业务业务接口实现类
 */
@Service
public class RoleMenuServiceImpl implements RoleMenuService {

    @Autowired
    private MenuMapper mapper;
    @Override
    public List<Menu> selectByRoleId(int id) {
        HashMap<Integer,ArrayList<Menu>> map = new HashMap<Integer, ArrayList<Menu>>();
        List<Menu> menus = mapper.selectByRoleId(id);
        for(Menu menu : menus){
            int parentid = menu.getParentid();
            if(menu.getRoleid() != 0){
                menu.setAdditionalParameters(new HashMap<String, Object>());
                menu.getAdditionalParameters().put("item-selected",true);
            }
            if(map.containsKey(parentid)){
                map.get(parentid).add(menu);
            }else{
                ArrayList<Menu> temp = new ArrayList<Menu>();
                temp.add(menu);
                map.put(parentid,temp);
            }
        }
        for(Menu menu : menus){
            int mid = menu.getId();
            if(map.containsKey(mid)){
                menu.setType("folder");
                menu.setChildren(map.get(mid));
            }else{
                menu.setType("item");
            }
        }
        return map.get(0);
    }

    @Override
    public boolean updateRoleMenu(String ids,int roleid,int userid) {
        if(ids.length() > 0){
            ids = ids.substring(0,ids.length()-1);
        }
        HashMap<String,Object> map = new HashMap<String, Object>();
        map.put("menuids",ids);
        map.put("roleid",roleid);
        map.put("userid",userid);
        mapper.roleMenuUpdate(map);
        return true;
    }
}
