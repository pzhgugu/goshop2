package org.goshop.cms.i;

import com.github.pagehelper.PageInfo;
import org.goshop.cms.pojo.CmsArticleClass;

import java.util.List;

/**
 * Created by Administrator on 2016/4/21.
 */
public interface CmsArticleClassService {
    PageInfo<CmsArticleClass> findGradeByParentId(Integer curPage, Integer pageSize, Long parentId);

    List<CmsArticleClass> findByParentId(Long parentId);

    int save(CmsArticleClass cmsArticleClass);

    CmsArticleClass findOne(Long classId);

    int update(CmsArticleClass cmsArticleClass);

    boolean checkByIdNameParentId(Long classId, String className, Long parentId);

    int updateClassSort(Long classId, String value);

    int updateClassName(Long classId, String value);

    int delete(Long classId);

    void delete(Long[] classIds);

    List<CmsArticleClass> findTreeByParentId(Long parentId);
}
