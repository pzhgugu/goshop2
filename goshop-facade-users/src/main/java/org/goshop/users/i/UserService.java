package org.goshop.users.i;


import org.goshop.users.pojo.Role;
import org.goshop.users.pojo.User;

import java.util.List;

/**
 * Created by Administrator on 2016/3/11.
 */
public interface UserService {
    /**
     * 添加用户
     * @param user
     * @return
     */
    int save(User user);

    //int updateByPrimaryKey(User user);

    int updateByPrimaryKeySelective(User user);

    User findOne(Long userId);

    User findByLoginName(String loginName);

    int delete(Long userId);

    User findOfRoleOne(Long userId);

    void updateLoginInfo(User user, String ip);

    List<Role> findByRole(Long userId);

    int updateByPrimaryKey(User user);

    User selectByPrimaryKey(Long userId);

    int insert(User user);
}
