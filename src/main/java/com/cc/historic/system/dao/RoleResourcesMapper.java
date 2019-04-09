package com.cc.historic.system.dao;

import com.cc.historic.system.model.Resources;
import com.cc.historic.system.model.RoleResources;

import java.util.List;

public interface RoleResourcesMapper {
    int deleteByPrimaryKey(String id);

    int insert(RoleResources record);

    RoleResources selectByPrimaryKey(String id);

    List<RoleResources> selectAll();

    int updateByPrimaryKey(RoleResources record);

    void deleteByT(RoleResources[] roleResources);

    List<RoleResources> findTByT(RoleResources roleResources);

    List<Resources> findResourcesByT(Resources resources);
}