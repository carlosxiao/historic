package com.cc.historic.system.service;

import com.cc.historic.common.model.GetEasyUIData;
import com.cc.historic.system.model.Dict;
import com.cc.historic.system.model.DictPage;

import java.util.List;

public interface DictService {

    GetEasyUIData findTByPage(DictPage dict);

    void insertDict(Dict dict);

    void updateByPrimaryKeyDict(Dict dict);

    void deleteByPrimaryKeyDict(String[] id);

    Dict selectByPrimaryKey(String id);

    List<Dict> findTByT(Dict dict);
}
