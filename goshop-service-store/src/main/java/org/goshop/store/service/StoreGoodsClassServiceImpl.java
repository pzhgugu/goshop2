package org.goshop.store.service;

import org.goshop.store.i.StoreGoodsClassService;
import org.goshop.goods.mapper.master.StoreGoodsClassMapper;
import org.goshop.store.pojo.StoreGoodsClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("storeGoodsClassService")
public class StoreGoodsClassServiceImpl implements StoreGoodsClassService {
    @Autowired
    StoreGoodsClassMapper storeGoodsClassMapper;

    @Override
    public List<StoreGoodsClass> findByStcParentId(Integer parentId) {
        return storeGoodsClassMapper.findByStcParentId(parentId);
    }
}
