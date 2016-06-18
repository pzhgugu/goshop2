package org.goshop.users.service;


import org.goshop.users.i.AdminService;
import org.goshop.users.mapper.master.RoleMapper;
import org.goshop.users.mapper.master.UserMapper;
import org.goshop.users.mapper.master.UserRoleMapper;
import org.goshop.users.mapper.read.ReadUserMapper;
import org.goshop.users.pojo.UserRole;
import org.goshop.users.pojo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("adminService")
public class AdminServiceImpl implements AdminService {

    private final static String ADMIN_ROLE="admin";

    @Autowired
    ReadUserMapper userMapper;

    @Autowired
    RoleMapper roleMapper;

    @Autowired
    UserRoleMapper userRoleMapper;

    @Override
    public Integer getIsAdmin(Long userId) {
        return userMapper.findByRoleCount(userId, ADMIN_ROLE);
    }

    @Override
    public void setAdmin(Long userId,Integer isAdmin) {
        if(userId==0){
            return;
        }
        Role role = roleMapper.findByName(ADMIN_ROLE);
        UserRole userRole = userRoleMapper.findByUIdAndRId(userId, role.getId());
        if(isAdmin!=null&&isAdmin==1){
            if(userRole==null) {
                userRole=new UserRole();
                userRole.setuId(userId);
                userRole.setrId(role.getId());
                userRoleMapper.insert(userRole);
            }
        }else{
            if(userRole!=null) {
                userRoleMapper.deleteByUIdAndRId(userId, role.getId());
            }
        }
    }
}
