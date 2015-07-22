package com.web.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.base.action.BaseAction;
import com.web.service.IQuestionService;

/**
 * 问题 action
 * 
 * @author Liup
 */
@Namespace("/")
@Action(value = "question", results = {
		@Result(name = "question_list", location = "/pages/user/user_list.jsp"),
		@Result(name = "question_info", location = "/pages/user/user_info.jsp")
})
public class QuestionAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	@Resource
	private IQuestionService questionService;

	/**
	 * 查询用户列表
	 */
	@Override
	public String execute() throws Exception {
		return "user_list";
	}
}
