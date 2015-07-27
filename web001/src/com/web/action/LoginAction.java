package com.web.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

import com.base.action.BaseAction;
import com.web.entity.User;
import com.web.service.IUserService;

/**
 * 登陆action
 * 
 * @author Liup
 */
@Namespace("/")
@Action(value = "login")
public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private User user;
	
	@Resource
	private IUserService userService;
	
	@Override
	public String execute() throws Exception {
		writeJson(userService.login(user));
		return null;
	}

	// setter getter
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}