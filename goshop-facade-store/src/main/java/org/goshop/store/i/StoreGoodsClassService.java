package org.goshop.store.i;

import org.goshop.store.pojo.StoreGoodsClass;

import java.util.List;

/**
 * Created by Administrator on 2016/4/12.
 */
public interface StoreGoodsClassService {
    List<StoreGoodsClass> findByStcParentId(Integer id);
}
