package org.goshop.users.service;

import org.goshop.common.exception.MapperException;
import org.goshop.common.utils.RandomUtils;
import org.goshop.shiro.service.PasswordService;
import org.goshop.users.i.UserService;
import org.goshop.users.mapper.master.UserMapper;
import org.goshop.users.mapper.read.ReadUserMapper;
import org.goshop.users.pojo.Role;
import org.goshop.users.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by Administrator on 2016/6/11.
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    ReadUserMapper readUserMapper;

    @Autowired
    private PasswordService passwordService;

    @Override
    public int save(User user) {
        User userDataBase=this.findByLoginName(user.getLoginName());
        if(userDataBase!=null){
            throw new MapperException("登录名称重复");
        }
        return userMapper.insertSelective(passWordUser(user));
    }

    @Override
    public int updateByPrimaryKeySelective(User user) {
        return userMapper.updateByPrimaryKeySelective(passWordUser(user));
    }

    @Override
    public User findOne(Long userId) {
        return readUserMapper.selectByPrimaryKey(userId);
    }

    @Override
    public User findByLoginName(String loginName) {
        return readUserMapper.findByLoginName(loginName);
    }

    @Override
    public int delete(Long userId ){
        return userMapper.deleteByPrimaryKey(userId);
    }

    @Override
    public User findOfRoleOne(Long userId) {
        return readUserMapper.findOfRoleOne(userId);
    }

    @Override
    public void updateLoginInfo(User user, String ip) {
        User loginUserInfo = new User();
        loginUserInfo.setId(user.getId());
        loginUserInfo.setLoginNum(user.getLoginNum() + 1);
        loginUserInfo.setLoginIp(ip);
        loginUserInfo.setOldLoginIp(user.getLoginIp());
        loginUserInfo.setLoginTime(new Timestamp(System.currentTimeMillis()));
        loginUserInfo.setOldLoginTime(user.getLoginTime());
        userMapper.updateLoginInfo(loginUserInfo);
    }

    @Override
    public List<Role> findByRole(Long userId) {
        return readUserMapper.findByRole(userId);
    }


    /**
     * 将密码加密
     * @param user
     * @return
     */
    private  User passWordUser(User user){

        if(StringUtils.hasText(user.getPassword())){
            String salt= RandomUtils.generateString(5);
            user.setPassword(passwordService.encryptPassword(user.getPassword(),salt));
            user.setSalt(salt);
        }
        return user;
    }
}
