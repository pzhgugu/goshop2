package org.goshop.goods.service;

import org.goshop.goods.i.GoodsTypeService;
import org.goshop.goods.pojo.GoodsType;
import org.goshop.store.mapper.master.GoodsTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("goodsTypeService")
public class GoodsTypeServiceImpl implements GoodsTypeService {

    @Autowired
    GoodsTypeMapper goodsTypeMapper;

    @Override
    public List<GoodsType> findAll() {
        return goodsTypeMapper.findAll();
    }
}
