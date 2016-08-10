package org.goshop.store.mapper.master;

import org.goshop.store.pojo.StoreJoin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StoreJoinMapper {

    //已提交申请
    static String JOIN_STATIC_APPLY = "10";
    //缴费完成
    static String JOIN_STATIC_PAY = "11";
    //审核成功
    static String JOIN_STATIC_EXMINE_YES = "20";
    //审核失败
    static String JOIN_STATIC_EXMINE_NO = "30";
    //缴费审核失败
    static String JOIN_STATIC_PAY_NO = "31";
    //审核通过开店
    static String JOIN_STATIC_YES = "40";

    int deleteByPrimaryKey(Long memberId);

    int insert(StoreJoin record);

    int insertSelective(StoreJoin record);

    StoreJoin selectByPrimaryKey(Long memberId);

    int updateByPrimaryKeySelective(StoreJoin record);

    int updateByPrimaryKey(StoreJoin record);

    List<StoreJoin> findBySellerName(@Param("sellerName") String sellerName);

    List<StoreJoin> findByStoreName(@Param("storeName") String storeName);

    List<StoreJoin> findAll();
}