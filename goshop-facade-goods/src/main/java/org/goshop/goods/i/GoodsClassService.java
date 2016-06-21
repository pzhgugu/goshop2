package org.goshop.goods.i;

import com.github.pagehelper.PageInfo;
import org.goshop.goods.pojo.GoodsClass;

import java.util.List;

/**
 * Created by Administrator on 2016/4/12.
 */
public interface GoodsClassService {

    List<GoodsClass> findTreeByGcParentId(Integer gcParentId);

    List<GoodsClass> findByGcParentId(Integer gcParentId);

    int save(GoodsClass goodsClass);

    boolean checkByIdNameParentId(Integer gcId, String gcName, Integer gcParentId);

    PageInfo<GoodsClass> findAll(Integer curPage, Integer size);

    PageInfo<GoodsClass> findGradeByGcParentId(Integer gcParentId, Integer curPage, Integer size);

    List<GoodsClass> findGradeByGcParentId(Integer gcParentId);

    GoodsClass findOne(Integer gcId);

    int delete(Integer id);
}
