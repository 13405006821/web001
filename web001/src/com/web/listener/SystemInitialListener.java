package com.web.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import com.base.util.Constants;
import com.base.util.SpringUtil;
import com.base.util.SystemConfig;

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
		ServletContext application = config.getServletContext();
		SystemConfig systemConfig = (SystemConfig) SpringUtil.getBean("systemConfig");
		application.setAttribute(Constants.APPLICATION_COMPANYNAME, systemConfig.getCompanyName());
		application.setAttribute(Constants.APPLICATION_SYSTEMNAME, systemConfig.getSystemName());
	}
}