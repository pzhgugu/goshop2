package org.goshop.users.service;

import com.alibaba.fastjson.JSONObject;
import org.goshop.base.service.SpringBaseTest;
import org.goshop.email.pojo.MailParam;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

import javax.jms.JMSException;

import static org.junit.Assert.*;

/**
 * Created by Administrator on 2016/7/15.
 */
public class MemberServiceImplTest extends SpringBaseTest {

    @Autowired
    private JmsTemplate activeMqJmsTemplate;

    @Test
    public void testSendEmailFindPassword() throws Exception {
        final MailParam mail = new MailParam();
        mail.setTo("pzh_gugu@126.com");
        mail.setSubject("找回密码");
        mail.setContent("何宇！！！");
        //eMailService.send(mail);
        activeMqJmsTemplate.send(new MessageCreator() {
            public javax.jms.Message createMessage(javax.jms.Session session) throws JMSException {
                return session.createTextMessage(JSONObject.toJSONString(mail));
            }
        });
    }
}