package org.goshop.store.i;

import com.github.pagehelper.PageInfo;
import org.goshop.store.pojo.StoreClass;

import java.util.List;

/**
 * Created by Administrator on 2016/3/29.
 */
public interface StoreClassService {
    List<StoreClass> findAllOrderBySort();

    int save(StoreClass storeClass);

    /**
     * 校验是否存在此分类名称
     * @param name
     * @return
     */
    boolean checkByNameParentId(String name, Long parentId);

    PageInfo<StoreClass> findTreePageByParentId(Integer curPage, Integer pageSize, Long parentId);

    StoreClass findOne(Long id);

    boolean checkByIdNameParentId(Long id, String name, Long parentId);

    int update(StoreClass storeClass);

    int updateSort(Long id, String value);

    int updateName(Long id, String value);

    List<StoreClass> findByParentId(Long parentId);

    int delete(Long id);

    void delete(Long[] ids);

    List<StoreClass> findTreeByParentId(Long parentId);

    PageInfo<StoreClass> findGradeByParentId(Integer curPage, Integer pageSize, Long parentId);
}
