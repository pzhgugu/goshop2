package org.goshop.store.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DubboProvider {

	private static final Log log = LogFactory.getLog(DubboProvider.class);

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = null;
		try {
			context = new ClassPathXmlApplicationContext("classpath:spring/spring-context.xml");
			context.start();
			final ClassPathXmlApplicationContext startedContext = context;
			Runtime.getRuntime().addShutdownHook(new Thread(new Runnable() {
				@Override
				public void run() {
					startedContext.close();
				}
			}));
			log.info("== DubboProvider context started ==");
		} catch (Exception e) {
			log.error("== DubboProvider context start error:", e);
			if (context != null) {
				context.close();
			}
			return;
		}
		synchronized (DubboProvider.class) {
			while (true) {
				try {
					DubboProvider.class.wait();
				} catch (InterruptedException e) {
					log.error("== synchronized error:", e);
				}
			}
		}
	}
}
