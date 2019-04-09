package com.cc.historic.system.service;

import com.cc.historic.common.model.GetEasyUIData;
import com.cc.historic.system.model.User;
import com.cc.historic.system.model.UserAddModel;
import com.cc.historic.system.model.UserPage;
import com.cc.historic.system.model.UserRole;
import com.cc.historic.system.vo.UserVO;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User selectByPrimaryKey(String id);

    void insertUser(UserAddModel muser);

    void updateUser(UserAddModel muser);

    void deleteUser(String[] id);

    void updatePassword(UserAddModel u);

    GetEasyUIData findTByPage(UserPage user);

    UserVO selectVOByPrimaryKey(String id);

    User findTByT(User user);

    void deleteByT(UserRole[] u);


}
