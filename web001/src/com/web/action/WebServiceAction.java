package com.web.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.base.action.BaseAction;

/**
 * webService action
 * 
 * @author Liup
 */
@Namespace("/")
@Action(value = "webService", results = {
		@Result(name = "user_list", location = "/pages/user/user_list.jsp"),
		@Result(name = "user_info", location = "/pages/user/user_info.jsp")
})
public class WebServiceAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 查询用户列表
	 */
	@Override
	public String execute() throws Exception {
		return "user_list";
	}
}