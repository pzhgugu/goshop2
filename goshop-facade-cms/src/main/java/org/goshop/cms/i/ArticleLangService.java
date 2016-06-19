package org.goshop.cms.i;

import com.github.pagehelper.PageInfo;
import org.goshop.cms.pojo.ArticleLangInfo;
import org.goshop.cms.pojo.ArticleLangMain;

import java.util.List;

/**
 * Created by Administrator on 2016/5/7.
 */
public interface ArticleLangService {

     PageInfo<ArticleLangMain> findManyAll(Integer curPage, Integer pageSize);

     PageInfo<ArticleLangMain> queryMany(Integer curPage, Integer pageSize, String articleTitle, String articlePublisherName, Integer articleState, Long articleClassId);

     PageInfo<ArticleLangMain> findManyByArticleClassId(Integer curPage, Integer pageSize, Long articleClassId);

     /**
      * 查询已发布文章
      * @param curPage
      * @param pageSize
      * @return
      */
     PageInfo<ArticleLangMain> findPublishManyByArticleClassId(Integer curPage, Integer pageSize, Long articleClassId, String year, String langType);

     /**
      * 查询已发布文章,精简版，用于列表查询
      * @param curPage
      * @param pageSize
      * @param articleClassId
      * @param year
      * @param langType
     * @return
     */
     PageInfo<ArticleLangMain> findRetrenchPublishManyByArticleClassId(Integer curPage, Integer pageSize, Long articleClassId, String year, String langType);

     /**
      * 查询图片新闻
      * @param curPage
      * @param pageSize
      * @param articleClassId
      * @param year
      * @param langType
     * @return
     */
     PageInfo<ArticleLangMain> findRetrenchImagePublishManyByArticleClassId(Integer curPage, Integer pageSize, Long articleClassId, String year, String langType);

     int save(ArticleLangMain articleLang, List<ArticleLangInfo> articleLangInfoList);

     ArticleLangMain findManyOne(Long articleId);

     int update(ArticleLangMain articleLang, List<ArticleLangInfo> articleLangInfoList);

     ArticleLangMain findMainOne(Long articleId);

     int update(ArticleLangMain articleLangMain);

     int delete(Long articleId);

     int updateByArticleSort(Long articleId, Integer articleSort);

   }
