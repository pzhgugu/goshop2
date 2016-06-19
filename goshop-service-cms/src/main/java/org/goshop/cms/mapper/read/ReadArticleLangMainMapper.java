package org.goshop.cms.mapper.read;

import org.goshop.cms.pojo.ArticleLangMain;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReadArticleLangMainMapper {
    int deleteByPrimaryKey(Long articleId);

    int insert(ArticleLangMain record);

    int insertSelective(ArticleLangMain record);

    ArticleLangMain selectByPrimaryKey(Long articleId);

    int updateByPrimaryKeySelective(ArticleLangMain record);

    int updateByPrimaryKeyWithBLOBs(ArticleLangMain record);

    int updateByPrimaryKey(ArticleLangMain record);

    /**
     * 查询全部主从表信息
     * @return
     */
    List<ArticleLangMain> findManyAll();

    ArticleLangMain findManyOne(Long articleId);

    List<ArticleLangMain> queryMany(@Param("articleTitle") String articleTitle, @Param("articleAuthor") String articleAuthor, @Param("articleState") Integer articleState, @Param("articleClassId") Long articleClassId);

    int updateByArticleSort(@Param("articleId") Long articleId, @Param("articleSort") Integer articleSort);

    List<ArticleLangMain> findManyByArticleClassId(Long articleClassId);

    List<ArticleLangMain> findPublishManyByArticleClassId(@Param("articleClassId") Long articleClassId, @Param("year") String year, @Param("langType") String langType);

    List<ArticleLangMain> findRetrenchPublishManyByArticleClassId(@Param("articleClassId") Long articleClassId, @Param("year") String year, @Param("langType") String langType);

    List<ArticleLangMain> findRetrenchImagePublishManyByArticleClassId(@Param("articleClassId") Long articleClassId, @Param("year") String year, @Param("langType") String langType);
}