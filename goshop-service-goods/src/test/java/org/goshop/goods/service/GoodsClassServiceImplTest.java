package org.goshop.goods.service;

import org.goshop.base.service.SpringBaseTest;
import org.goshop.goods.i.GoodsClassService;
import org.goshop.goods.pojo.GoodsClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Administrator on 2016/6/22.
 */
public class GoodsClassServiceImplTest extends SpringBaseTest {

    @Autowired
    GoodsClassService goodsClassService;

    @Test
    public void testFindTreeByGcParentId() throws Exception {
        List<GoodsClass>  goodsClassList=goodsClassService.findByGcParentId(1);
        super.logger.info(goodsClassList.size());
    }

    @Test
    public void testFindByGcParentId() throws Exception {

    }

    @Test
    public void testSave() throws Exception {

    }

    @Test
    public void testCheckByIdNameParentId() throws Exception {

    }

    @Test
    public void testFindAll() throws Exception {

    }

    @Test
    public void testFindGradeByGcParentId() throws Exception {

    }

    @Test
    public void testFindGradeByGcParentId1() throws Exception {

    }

    @Test
    public void testFindOne() throws Exception {

    }

    @Test
    public void testDelete() throws Exception {

    }
}