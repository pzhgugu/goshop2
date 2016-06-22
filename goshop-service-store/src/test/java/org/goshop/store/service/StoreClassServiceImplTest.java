package org.goshop.store.service;

import org.goshop.base.service.SpringBaseTest;
import org.goshop.store.i.StoreClassService;
import org.goshop.store.pojo.StoreClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Administrator on 2016/6/22.
 */
public class StoreClassServiceImplTest extends SpringBaseTest {

    @Autowired
    StoreClassService storeClassService;

    @Test
    public void testFindByParentId() throws Exception {
        List<StoreClass> list=storeClassService.findByParentId(Long.valueOf(9));
        super.logger.info(list.size());
    }
}