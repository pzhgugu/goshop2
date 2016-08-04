/**
 * 基于Dubbo的分布式系统架构视频教程，吴水成，wu-sc@foxmail.com，学习交流QQ群：367211134 .
 */
package org.goshop.mqemail.consumer;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.apache.activemq.command.ActiveMQTextMessage;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.jms.listener.SessionAwareMessageListener;
import org.springframework.stereotype.Component;

import wusc.edu.demo.mqtest.biz.MailBiz;
import wusc.edu.demo.mqtest.params.MailParam;

import com.alibaba.fastjson.JSONObject;

/**
 * 
 * @描述: 队列监听器 .
 */
@Component
public class ConsumerSessionAwareMessageListener implements SessionAwareMessageListener<Message> {

	private static final Log log = LogFactory.getLog(ConsumerSessionAwareMessageListener.class);

	@Autowired
	private JmsTemplate activeMqJmsTemplate;
	@Autowired
	private Destination sessionAwareQueue;
	@Autowired
	private MailBiz bailBiz;

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
				bailBiz.mailSend(mailParam);
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
