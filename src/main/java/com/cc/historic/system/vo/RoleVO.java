package com.cc.historic.system.vo;

import com.cc.historic.system.model.Role;
import com.cc.historic.system.model.RoleResources;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoleVO extends Role {
    private List<RoleResources> roleResourcesList;
}
