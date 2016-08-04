package org.goshop.mqemail.producer;


import org.goshop.base.service.SpringBaseTest;
import org.goshop.email.pojo.MailParam;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2016/6/30.
 */
public class MQProducerTest extends SpringBaseTest {

    @Autowired
    MQProducer mqProducer;

    @Test
    public void testSendMessage() throws Exception {
        try {
            // 邮件发送
            MailParam mail = new MailParam();
            mail.setTo("wu-sc@foxmail.com");
            mail.setSubject("ActiveMQ测试");
            mail.setContent("通过ActiveMQ异步发送邮件！");

            mqProducer.sendMessage(mail);
        } catch (Exception e) {
            super.logger.error("==>MQ context start error:", e);
        } finally {
            super.logger.info("===>System.exit");
        }
    }
}