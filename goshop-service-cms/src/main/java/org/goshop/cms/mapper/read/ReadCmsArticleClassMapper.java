package org.goshop.cms.mapper.read;

import org.goshop.cms.pojo.CmsArticleClass;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReadCmsArticleClassMapper {
    int deleteByPrimaryKey(Long classId);

    int insert(CmsArticleClass record);

    int insertSelective(CmsArticleClass record);

    CmsArticleClass selectByPrimaryKey(Long classId);

    int updateByPrimaryKeySelective(CmsArticleClass record);

    int updateByPrimaryKey(CmsArticleClass record);

    List<CmsArticleClass> findGradeByParentId(@Param("parentId") Long parentId);

    List<CmsArticleClass> findByParentId(@Param("parentId") Long parentId);

    List<CmsArticleClass> findByNameParentId(@Param("className") String className, @Param("parentId") Long parentId);

    int updateClassSort(@Param("classId") Long classId, @Param("classSort") Integer classSort);

    int updateClassName(@Param("classId") Long classId, @Param("className") String className);

    List<CmsArticleClass> findTreeByParentId(@Param("parentId") Long parentId);
}