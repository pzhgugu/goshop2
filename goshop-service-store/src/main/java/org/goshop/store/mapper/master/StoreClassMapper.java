package org.goshop.store.mapper.master;

import org.goshop.store.pojo.StoreClass;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StoreClassMapper {
    int deleteByPrimaryKey(Long id);

    int insert(StoreClass record);

    int insertSelective(StoreClass record);

    StoreClass selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(StoreClass record);

    int updateByPrimaryKey(StoreClass record);

    List<StoreClass> findAllOrderBySort();

    int findCountByNameParentId(@Param("name") String name, @Param("parentId") Long parentId);

    List<StoreClass> findTreeByParentId(Long parentId);

    List<StoreClass> findByNameParentId(@Param("name") String name, @Param("parentId") Long parentId);

    int updateSort(@Param("id") Long id, @Param("sort") Integer sort);

    int updateName(@Param("id") Long id, @Param("name") String name);

    List<StoreClass> findByParentId(@Param("parentId") Long parentId);

    List<StoreClass> findGradeByParentId(@Param("parentId") Long parentId);
}