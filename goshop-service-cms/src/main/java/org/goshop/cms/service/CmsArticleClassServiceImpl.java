package org.goshop.cms.service;

import com.github.pagehelper.PageInfo;
import org.goshop.common.exception.MapperException;
import org.goshop.common.utils.PageUtils;
import org.goshop.cms.i.CmsArticleClassService;
import org.goshop.cms.mapper.master.CmsArticleClassMapper;
import org.goshop.cms.pojo.CmsArticleClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.List;

@Service("cmsArticleClassService")
public class CmsArticleClassServiceImpl implements CmsArticleClassService{

    @Autowired
    CmsArticleClassMapper cmsArticleClassMapper;

    @Override
    public PageInfo<CmsArticleClass> findGradeByParentId(Integer curPage, Integer pageSize, Long parentId) {
        PageUtils.startPage(curPage,pageSize);
        //2、查询结果
        List<CmsArticleClass> list=cmsArticleClassMapper.findGradeByParentId(parentId);
        //3、取分页后结果
        PageInfo<CmsArticleClass> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public List<CmsArticleClass> findByParentId(Long parentId) {
        return cmsArticleClassMapper.findByParentId(parentId);
    }

    @Override
    public int save(CmsArticleClass cmsArticleClass) {
        return cmsArticleClassMapper.insertSelective(cmsArticleClass);
    }

    @Override
    public CmsArticleClass findOne(Long classId) {
        return cmsArticleClassMapper.selectByPrimaryKey(classId);
    }

    @Override
    public int update(CmsArticleClass cmsArticleClass) {
        return cmsArticleClassMapper.updateByPrimaryKeySelective(cmsArticleClass);
    }

    @Override
    public boolean checkByIdNameParentId(Long classId, String className, Long parentId) {
        List<CmsArticleClass> list = cmsArticleClassMapper.findByNameParentId(className,parentId);
        if(list.size()>1){
            throw new MapperException("数据异常");
        }else if(list.size()==1){
            if(classId==null){
                return false;
            }else if(list.get(0).getClassId()!=classId){
                return false;
            }
        }
        return true;
    }

    @Override
    public int updateClassSort(Long id, String value) {
        Assert.notNull(id, "id不能为空！");
        Assert.hasText(value,"排序值不能为空！");
        return cmsArticleClassMapper.updateClassSort(id, Integer.valueOf(value));
    }

    @Override
    public int updateClassName(Long id, String value) {
        Assert.notNull(id,"id不能为空！");
        Assert.hasText(value,"名称不能为空！");
        return cmsArticleClassMapper.updateClassName(id, value);
    }

    @Override
    public int delete(Long classId) {
       return  cmsArticleClassMapper.deleteByPrimaryKey(classId);
    }

    @Override
    public void delete(Long[] classIds) {
        for(Long id:classIds){
            this.delete(id);
        }
    }

    @Override
    public List<CmsArticleClass> findTreeByParentId(Long parentId) {
        return cmsArticleClassMapper.findTreeByParentId(parentId);
    }
}
