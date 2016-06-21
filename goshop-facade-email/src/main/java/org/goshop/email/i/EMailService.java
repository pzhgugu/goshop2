package org.goshop.email.i;

/**
 * Created by Administrator on 2016/3/21.
 */
public interface EMailService {
    /**
     * 发送邮件
     * @param email 邮件地址
     * @param title 邮件标题
     * @param emailContent 邮件内容
     */
    void send(String email, String title, String emailContent);
}
