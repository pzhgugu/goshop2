package org.goshop.cms.i;

import com.github.pagehelper.PageInfo;
import org.goshop.cms.pojo.CmsArticle;
import org.goshop.cms.pojo.CmsArticleWithBLOBs;

/**
 * Created by Administrator on 2016/4/22.
 */
public interface CmsArticleService {

    //草稿箱
    public static final Integer TYPE_DRAFT=1;
    //审核箱
    public static final Integer TYPE_VERIFY=2;
    //发布箱
    public static final Integer TYPE_PUBLISH=3;
    //垃圾箱
    public static final Integer TYPE_RUBBISH=4;
    /**
     * 按文件类型查询
     * @param curPage
     * @param pageSize
     * @param articleState
     * @return
     */
    PageInfo<CmsArticle> findBaseByArticleState(Integer curPage, Integer pageSize, Integer articleState);

    PageInfo<CmsArticle> query(Integer curPage, Integer pageSize, Integer articleState, String articleTitle, String articlePublisherName);

    int save(CmsArticleWithBLOBs cmsArticle);

    int delete(Long articleId);

    CmsArticleWithBLOBs findOne(Long articleId);

    int update(CmsArticleWithBLOBs cmsArticle);

    /**
     * 更新文章推荐标志
     * @param articleId
     * @param articleCommendFlag
     * @return
     */
    int updateByArticleCommendFlag(Long articleId, Integer articleCommendFlag);

    int updateByArticleCommendImageFlag(Long articleId, Integer articleCommendImageFlag);

    int updateByArticleCommentFlag(Long articleId, Integer articleCommentFlag);

    int updateByArticleAttitudeFlag(Long articleId, Integer articleAttitudeFlag);

    int updateByArticleSort(Long articleId, Integer articleSort);

    int updateByArticleClick(Long articleId, Integer articleClick);

}
