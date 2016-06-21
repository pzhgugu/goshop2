package org.goshop.store.i;

import com.github.pagehelper.PageInfo;
import org.goshop.store.model.StoreInfoModel;
import org.goshop.store.pojo.Store;
import org.goshop.store.pojo.StoreJoin;
import org.goshop.users.pojo.User;

/**
 * Created by Administrator on 2016/3/24.
 */
public interface StoreJoinService {
    /**
     * 用户申请卖家
     * @param storeJoin
     */
    void applySeller(User user, StoreJoin storeJoin);

    /**
     * 第三步用户申请卖家，并返回所需的实体信息
     * @param user
     * @param storeJoin
     * @return
     */
    StoreInfoModel applySellerThree(User user, StoreJoin storeJoin);

    boolean verificationSellerName(String sellerName, Long userId);

    boolean verificationStoreName(String storeName, Long userId);

    StoreJoin save(User user, StoreJoin storeJoin, String[] ids, String[] names);

    Store getCurrentStore(User user);

    StoreJoin getCurrentUserStoreJoin(User user);

    int paySave(StoreJoin storeJoin);

    PageInfo<StoreJoin> findAll(Integer curPage, Integer pageSize);

    StoreJoin find(Long memberId);

    void saveVerify(Long member_id, String verify_type, String join_message, String[] commis_rate);
}
