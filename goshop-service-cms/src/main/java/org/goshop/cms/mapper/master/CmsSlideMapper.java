package org.goshop.cms.mapper.master;

import org.goshop.cms.pojo.CmsSlide;

import java.util.List;

public interface CmsSlideMapper {
    int deleteByPrimaryKey(Integer slideId);

    int insert(CmsSlide record);

    int insertSelective(CmsSlide record);

    CmsSlide selectByPrimaryKey(Integer slideId);

    int updateByPrimaryKeySelective(CmsSlide record);

    int updateByPrimaryKey(CmsSlide record);

    List<CmsSlide> findAll();
}