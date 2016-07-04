/**
 * 基于Dubbo的分布式系统架构视频教程，吴水成，wu-sc@foxmail.com，学习交流QQ群：367211134 .
 */
package org.goshop.email.service;

import com.alibaba.fastjson.JSONObject;
import org.apache.activemq.command.ActiveMQTextMessage;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.goshop.email.i.EMailService;
import org.goshop.email.pojo.MailParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.listener.SessionAwareMessageListener;
import org.springframework.stereotype.Component;

import javax.jms.Destination;
import javax.jms.Message;
import javax.jms.Session;

/**
 * 
 * @描述: 队列监听器 .
 * @作者: WuShuicheng .
 * @创建时间: 2015-3-17,下午11:21:23 .
 * @版本号: V1.0 .
 */
@Component
public class ConsumerSessionAwareMessageListener implements SessionAwareMessageListener<Message> {

	private static final Log log = LogFactory.getLog(ConsumerSessionAwareMessageListener.class);

	@Autowired
	private JmsTemplate activeMqJmsTemplate;
	@Autowired
	private Destination sessionAwareQueue;
	@Autowired
	private EMailService eMailService;

	public synchronized void onMessage(Message message, Session session) {
		try {
			ActiveMQTextMessage msg = (ActiveMQTextMessage) message;
			final String ms = msg.getText();
			log.info("==>receive message:" + ms);
			MailParam mailParam = JSONObject.parseObject(ms, MailParam.class);// 转换成相应的对象
			if (mailParam == null) {
				return;
			}

			try {
				eMailService.threadSend(mailParam);
			} catch (Exception e) {
				// 发送异常，重新放回队列
//				activeMqJmsTemplate.send(sessionAwareQueue, new MessageCreator() {
//					public Message createMessage(Session session) throws JMSException {
//						return session.createTextMessage(ms);
//					}
//				});
				log.error("==>MailException:", e);
			}
		} catch (Exception e) {
			log.error("==>", e);
		}
	}
}
