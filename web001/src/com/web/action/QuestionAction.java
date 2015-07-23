package com.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;

import com.base.action.BaseAction;
import com.base.util.Json;
import com.web.entity.Question;
import com.web.service.IQuestionService;

/**
 * 问题 action
 * 
 * @author Liup
 */
@Namespace("/")
@Action(value = "question", results = {
		@Result(name = "list", location = "/pages/question/list.jsp"),
		@Result(name = "table", location = "/pages/question/table.jsp"),
		@Result(name = "info", location = "/pages/question/info.jsp")
})
public class QuestionAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private List<Question> list = new ArrayList<Question>();
	
	private Integer id;
	private String ids;
	private String name;
	private Question question;
	
	@Resource
	private IQuestionService questionService;

	@Override
	public String execute() throws Exception {
		return "list";
	}
	
	public String table(){
		list = questionService.findList(name, getStartIndex(), getPageSize());
		setCount(questionService.findCount(name));
		return "teacher_table";
	}

	public String info() throws Exception {
		return "info";
	}
	
	public void saveOrUpdate() throws Exception {
		Json json = new Json();
		try {
			questionService.saveOrUpdate(question);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}
	
	public void delete() throws Exception {
		Json json = new Json();
		try {
			questionService.delete(id);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}
	
	public void deleteByIds() throws Exception {
		Json json = new Json();
		try {
			questionService.deleteByIds(ids);
			json.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(json);
	}

	public List<Question> getList() {
		return list;
	}

	public void setList(List<Question> list) {
		this.list = list;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}
}
