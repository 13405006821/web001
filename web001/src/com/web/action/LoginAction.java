package com.web.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.base.action.BaseAction;
import com.base.util.Config;

/**
 * 登陆action
 * 
 * @author Liup
 */
@Namespace("/")
@Action(value = "login", results = {
		@Result(name = "teacher_list", location = "/pages/teacher/teacher_list.jsp"),
		@Result(name = "teacher_table", location = "/pages/teacher/teacher_table.jsp"),
		@Result(name = "teacher_info", location = "/pages/teacher/teacher_info.jsp")
})
public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	
	@Autowired
	private Config config;
	
	@Override
	public String execute() throws Exception {
		if(config.getUsername().equals(username) && config.getPassword().equals(password)){
			return "";
		}else{
			return "teacher_list";
		}
	}

	// setter getter
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}