package org.goshop.store.service;

import com.github.pagehelper.PageInfo;
import org.goshop.common.utils.PageUtils;
import org.goshop.store.i.StoreService;
import org.goshop.store.mapper.master.StoreMapper;
import org.goshop.store.pojo.Store;
import org.goshop.store.pojo.StoreJoin;
import org.goshop.store.pojo.StoreWithBLOBs;
import org.goshop.users.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

@Service("storeService")
public class StoreServiceImpl implements StoreService {

    @Autowired
    StoreMapper storeMapper;

    @Override
    public PageInfo<Store> findAll(Integer curPage, Integer pageSize) {
        PageUtils.startPage(curPage,pageSize);
        List<Store> list=storeMapper.findAll();
        return new PageInfo<>(list);
    }

    @Override
    public int openStore(StoreJoin storeJoin) {
        StoreWithBLOBs store = new StoreWithBLOBs();
        store.setStoreName(storeJoin.getStoreName());
        store.setGradeId(storeJoin.getSgId());
        store.setMemberName(storeJoin.getMemberName());
        store.setMemberId(storeJoin.getMemberId());
        store.setSellerName(storeJoin.getSellerName());
        store.setScId(storeJoin.getScId());
        store.setStoreCompanyName(storeJoin.getCompanyName());
        store.setStoreAddress(storeJoin.getCompanyAddressDetail());
        store.setStoreTel(storeJoin.getContactsPhone());
        store.setStoreImage1(storeJoin.getBusinessLicenceNumberElectronic());
        store.setStoreState(1);
        store.setStoreTime(new Date());
        return this.save(store);
    }

    @Override
    public int save(StoreWithBLOBs store) {
        return storeMapper.insertSelective(store);
    }

    @Override
    public Store getCurrentStore(User user) {
        return storeMapper.findByMemberId(user.getId());
    }

    @Override
    public PageInfo<Store> find(Integer gradeId, String sellerName, String storeType, String storeName, Integer curPage, Integer pageSize) {

        //店铺状态
        Integer storeState =null;
        //是否即将过期
        Boolean isExpire=null;
        //是否过期
        Boolean isExpired=null;

        if(StringUtils.hasText(storeType)) {
            switch (storeType) {
                case "open":
                    storeState = 1;
                    break;
                case "close":
                    storeState = 0;
                    break;
                case "expire":
                    isExpire = true;
                    break;
                case "expired":
                    isExpired = true;
                    break;
            }
        }
        PageUtils.startPage(curPage,pageSize);
        List<Store> list=storeMapper.find(gradeId,sellerName,storeName,storeState,isExpire,isExpired);
        return new PageInfo<>(list);
    }

    @Override
    public Store findOne(Integer storeId) {
        return storeMapper.selectByPrimaryKey(storeId);
    }

    @Override
    public void update(StoreWithBLOBs store) {
        storeMapper.updateByPrimaryKeySelective(store);
    }

    @Override
    public Store findByMemberId(Long userId) {
        return storeMapper.findByMemberId(userId);
    }
}