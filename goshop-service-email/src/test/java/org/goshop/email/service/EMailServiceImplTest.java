package org.goshop.email.service;

import org.goshop.email.i.EMailService;
import org.goshop.email.pojo.MailParam;
import org.goshop.email.utils.SimpleMailSender;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.goshop.base.service.SpringBaseTest;

import javax.mail.MessagingException;

/**
 * Created by Administrator on 2016/6/21.
 */
public class EMailServiceImplTest extends SpringBaseTest {

    @Autowired
    EMailService eMailService;

    @Test
    public void testSend() throws Exception {

        SimpleMailSender sms = new SimpleMailSender("pzh_goshop@126.com","pzh1234567");
        try {
            sms.send("pzh_gugu@126.com","找回密码","你来吧！");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void threadSpringSend(){
        MailParam mail = new MailParam();
        mail.setTo("pzh_gugu@126.com");
        mail.setSubject("找回密码");
        mail.setContent("你来吧！");
        eMailService.threadSend(mail);
    }

    @Test
    public void springSend(){
        MailParam mail = new MailParam();
        mail.setTo("pzh_gugu@126.com");
        mail.setSubject("找回密码");
        mail.setContent("你来吧！");
        eMailService.send(mail);
    }

}