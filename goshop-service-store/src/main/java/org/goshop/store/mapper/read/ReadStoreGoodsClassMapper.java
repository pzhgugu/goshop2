package org.goshop.store.mapper.read;

import org.goshop.store.pojo.StoreGoodsClass;

import java.util.List;

public interface ReadStoreGoodsClassMapper {
    int deleteByPrimaryKey(Integer stcId);

    int insert(StoreGoodsClass record);

    int insertSelective(StoreGoodsClass record);

    StoreGoodsClass selectByPrimaryKey(Integer stcId);

    int updateByPrimaryKeySelective(StoreGoodsClass record);

    int updateByPrimaryKey(StoreGoodsClass record);

    List<StoreGoodsClass> findByStcParentId(Integer parentId);
}