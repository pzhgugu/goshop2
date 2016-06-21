package org.goshop.email.service;

import org.goshop.email.i.EMailService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import service.SpringBaseTest;

import static org.junit.Assert.*;

/**
 * Created by Administrator on 2016/6/21.
 */
public class EMailServiceImplTest extends SpringBaseTest {

    @Autowired
    EMailService eMailService;

    @Test
    public void testSend() throws Exception {
        eMailService.send("pzh_gugu@126.com","找回密码","你来吧！");
    }
}