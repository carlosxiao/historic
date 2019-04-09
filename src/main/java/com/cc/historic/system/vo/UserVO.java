package com.cc.historic.system.vo;

import com.cc.historic.system.model.User;
import com.cc.historic.system.model.UserRole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO extends User {
    private List<UserRole> UserRoleList;
}
