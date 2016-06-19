package org.goshop.cms.mapper.read;

import org.goshop.cms.pojo.ArticleLangInfo;

public interface ReadArticleLangInfoMapper {
    int deleteByPrimaryKey(Long articleInfoId);

    int insert(ArticleLangInfo record);

    int insertSelective(ArticleLangInfo record);

    ArticleLangInfo selectByPrimaryKey(Long articleInfoId);

    int updateByPrimaryKeySelective(ArticleLangInfo record);

    int updateByPrimaryKeyWithBLOBs(ArticleLangInfo record);

    int updateByPrimaryKey(ArticleLangInfo record);

    int deleteByArticleId(Long articleId);
}