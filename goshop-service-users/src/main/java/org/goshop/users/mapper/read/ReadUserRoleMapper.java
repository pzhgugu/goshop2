package org.goshop.users.mapper.read;

import org.apache.ibatis.annotations.Param;
import org.goshop.users.pojo.UserRole;

public interface ReadUserRoleMapper {
    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole findByUIdAndRId(@Param("uId") Long userId, @Param("rId") Long roleId);

    void deleteByUIdAndRId(@Param("uId") Long userId, @Param("rId") Long roleId);
}