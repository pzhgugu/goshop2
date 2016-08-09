package org.goshop.goods.mapper.master;

import org.goshop.store.pojo.Store;
import org.goshop.store.pojo.StoreWithBLOBs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StoreMapper {
    int deleteByPrimaryKey(Integer storeId);

    int insert(StoreWithBLOBs record);

    int insertSelective(StoreWithBLOBs record);

    StoreWithBLOBs selectByPrimaryKey(Integer storeId);

    int updateByPrimaryKeySelective(StoreWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(StoreWithBLOBs record);

    int updateByPrimaryKey(Store record);

    Store findByMemberId(@Param("memberId") Long memberId);

    List<Store> findAll();

    /**
     *
     * @param gradeId 等级
     * @param sellerName 店主
     * @param storeName 店铺
     * @param storeState 店铺状态
     * @param isExpire 是否即将过期
     * @param isExpired 是否过期
     * @return
     */
    List<Store> find(@Param("gradeId") Integer gradeId, @Param("sellerName") String sellerName, @Param("storeName") String storeName, @Param("storeState") Integer storeState, @Param("isExpire") Boolean isExpire, @Param("isExpired") Boolean isExpired);
}