package com.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

/**
 * 加载系统配置文件
 * 
 * @author liup
 * 
 */
public class SystemInitialListener implements ServletContextListener {

	private static Logger logger = Logger.getLogger(SystemInitialListener.class.getName());

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		logger.info("容器关闭……");
	}

	@Override
	public void contextInitialized(ServletContextEvent config) {
	}
}