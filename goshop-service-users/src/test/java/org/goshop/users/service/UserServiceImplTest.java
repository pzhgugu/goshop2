package org.goshop.users.service;

import org.goshop.base.service.SpringBaseTest;
import org.goshop.common.utils.RandomUtils;
import org.goshop.users.i.UserService;
import org.goshop.users.pojo.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import static org.junit.Assert.*;
import static org.junit.Assert.assertThat;
import static org.hamcrest.Matchers.is;
/**
 * Created by Administrator on 2016/6/15.
 */
public class UserServiceImplTest extends SpringBaseTest {

    @Autowired
    UserService userService;

    @Test
    @Rollback(false)
    public void testSave() throws Exception {
        User user = new User();
        String r = RandomUtils.generateString(8);
        String loginName="admin_"+r;
        user.setLoginName(loginName);
        user.setUserName("管理员_"+r);
        user.setPassword("1111");
       int i= userService.save(user);
        assertThat("保存失败",i,is(1));

        User userDataBase = userService.findByLoginName(loginName);
        assertNotNull("读数据错误",userDataBase);
    }


  /*  @Test
   @Test
    public void testFindByLoginName() throws Exception {

    }

    public void testUpdateByPrimaryKeySelective() throws Exception {

    }

    @Test
    public void testFindOne() throws Exception {

    }



    @Test
    public void testDelete() throws Exception {

    }

    @Test
    public void testFindOfRoleOne() throws Exception {

    }

    @Test
    public void testUpdateLoginInfo() throws Exception {

    }

    @Test
    public void testFindByRole() throws Exception {

    }*/
}