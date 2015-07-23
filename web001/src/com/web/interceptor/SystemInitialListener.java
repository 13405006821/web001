package com.web.interceptor;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import com.base.util.Constants;
import com.base.util.SpringUtil;
import com.web.entity.Question;
import com.web.service.IQuestionService;

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
		try {
			IQuestionService questionService = (IQuestionService) SpringUtil.getBean("questionService");
			List<Question> list = questionService.initFindAll();
			application.setAttribute(Constants.APPLICATION_ALL_QUESTION, list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}