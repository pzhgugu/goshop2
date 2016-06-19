package org.goshop.cms.mapper.read;

import org.goshop.cms.pojo.CmsSlide;

import java.util.List;

public interface ReadCmsSlideMapper {
    int deleteByPrimaryKey(Integer slideId);

    int insert(CmsSlide record);

    int insertSelective(CmsSlide record);

    CmsSlide selectByPrimaryKey(Integer slideId);

    int updateByPrimaryKeySelective(CmsSlide record);

    int updateByPrimaryKey(CmsSlide record);

    List<CmsSlide> findAll();
}