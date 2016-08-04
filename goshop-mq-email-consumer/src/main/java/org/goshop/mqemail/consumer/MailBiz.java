/**
 * 基于Dubbo的分布式系统架构视频教程，吴水成，wu-sc@foxmail.com，学习交流QQ群：367211134 .
 */
package org.goshop.mqemail.consumer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;

import wusc.edu.demo.mqtest.params.MailParam;


/**
 * 
 * @描述: 邮件发送业务逻辑类 .
 */
@Component("mailBiz")
public class MailBiz {

	@Autowired
	private JavaMailSender mailSender;// spring配置中定义
	@Autowired
	private SimpleMailMessage simpleMailMessage;// spring配置中定义
	@Autowired
	private ThreadPoolTaskExecutor threadPool;

	/**
	 * 发送模板邮件
	 * 
	 * @param mailParamTemp需要设置四个参数
	 *            templateName,toMail,subject,mapModel
	 */
	public void mailSend(final MailParam mailParam) {
		threadPool.execute(new Runnable() {
			public void run() {
				try {
					simpleMailMessage.setFrom(simpleMailMessage.getFrom()); // 发送人,从配置文件中取得
					simpleMailMessage.setTo(mailParam.getTo()); // 接收人
					simpleMailMessage.setSubject(mailParam.getSubject());
					simpleMailMessage.setText(mailParam.getContent());
					mailSender.send(simpleMailMessage);
				} catch (MailException e) {
					throw e;
				}
			}
		});
	}
}
