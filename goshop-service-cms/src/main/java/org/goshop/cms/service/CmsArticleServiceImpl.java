package org.goshop.cms.service;


import com.github.pagehelper.PageInfo;
import org.goshop.common.utils.PageUtils;
import org.goshop.cms.i.CmsArticleService;
import org.goshop.cms.mapper.master.CmsArticleMapper;
import org.goshop.cms.pojo.CmsArticle;
import org.goshop.cms.pojo.CmsArticleWithBLOBs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("cmsArticleService")
public class CmsArticleServiceImpl implements CmsArticleService {

    @Autowired
    CmsArticleMapper cmsArticleMapper;

    @Override
    public PageInfo<CmsArticle> findBaseByArticleState(Integer curPage, Integer pageSize, Integer articleState) {
        PageUtils.startPage(curPage,pageSize);
        List<CmsArticle> list = cmsArticleMapper.findBaseByArticleState(articleState);
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<CmsArticle> query(Integer curPage, Integer pageSize, Integer articleState, String articleTitle, String articlePublisherName) {
        PageUtils.startPage(curPage,pageSize);
        List<CmsArticle> list = cmsArticleMapper.query(articleState,articleTitle,articlePublisherName);
        return new PageInfo<>(list);
    }

    @Override
    public int save(CmsArticleWithBLOBs cmsArticle) {
        return cmsArticleMapper.insertSelective(cmsArticle);
    }

    @Override
    public int delete(Long articleId) {
        return cmsArticleMapper.deleteByPrimaryKey(articleId);
    }

    @Override
    public CmsArticleWithBLOBs findOne(Long articleId) {
        return cmsArticleMapper.selectByPrimaryKey(articleId);
    }

    @Override
    public int update(CmsArticleWithBLOBs cmsArticle) {
        return cmsArticleMapper.updateByPrimaryKeySelective(cmsArticle);
    }

    @Override
    public int updateByArticleCommendFlag(Long articleId, Integer articleCommendFlag) {
        return cmsArticleMapper.updateByArticleCommendFlag(articleId,articleCommendFlag);
    }

    @Override
    public int updateByArticleCommendImageFlag(Long articleId, Integer articleCommendImageFlag) {
        return cmsArticleMapper.updateByArticleCommendImageFlag(articleId, articleCommendImageFlag);
    }

    @Override
    public int updateByArticleCommentFlag(Long articleId, Integer articleCommentFlag) {
        return cmsArticleMapper.updateByArticleCommentFlag(articleId, articleCommentFlag);
    }

    @Override
    public int updateByArticleAttitudeFlag(Long articleId, Integer articleAttitudeFlag) {
        return cmsArticleMapper.updateByArticleAttitudeFlag(articleId, articleAttitudeFlag);
    }

    @Override
    public int updateByArticleSort(Long articleId, Integer articleSort) {
        return cmsArticleMapper.updateByArticleSort(articleId,articleSort);
    }

    @Override
    public int updateByArticleClick(Long articleId, Integer articleClick) {
        return cmsArticleMapper.updateByArticleClick(articleId,articleClick);
    }
}
