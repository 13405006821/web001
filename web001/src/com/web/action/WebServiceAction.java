package com.web.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;

import com.base.action.BaseAction;
import com.base.util.Constants;
import com.base.util.Json;
import com.web.entity.Question;
import com.web.service.IQuestionService;

/**
 * webService action
 * 
 * @author Liup
 */
@Namespace("/")
@Action(value = "webService")
public class WebServiceAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private IQuestionService questionService;
	
	/**
	 * 获取所有题目
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void getAllQuestion() throws Exception {
		Json json = new Json();
		try {
			List<Question> list = (List<Question>) getServletContext().getAttribute(Constants.APPLICATION_ALL_QUESTION);
			json.setSuccess(true);
			json.setObj(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}
	
	/**
	 * 获取随机100道考试题目
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void getTestQuestion() throws Exception {
		Json json = new Json();
		try {
			List<Question> list = (List<Question>) getServletContext().getAttribute(Constants.APPLICATION_ALL_QUESTION);
			Set<Integer> set = new HashSet<Integer>();
			while(set.size() < 100){
				set.add((int) ((list.size() - 1) * Math.random()));
			}
			List<Question> result = new ArrayList<Question>();
			for(int i : set){
				result.add(list.get(i));
			}
			json.setSuccess(true);
			json.setObj(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}
}