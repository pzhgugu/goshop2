package org.goshop.users.mapper.master;

import org.apache.ibatis.annotations.Param;
import org.goshop.users.pojo.Role;
import org.goshop.users.pojo.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    void updateLoginInfo(User user);
}