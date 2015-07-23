package com.web.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.IAnswerDao;
import com.web.dao.IQuestionDao;
import com.web.entity.Answer;
import com.web.entity.Question;
import com.web.service.IQuestionService;

@Service("questionService")
public class QuestionServiceImpl implements IQuestionService {
	
	@Autowired
	private IAnswerDao answerDao;
	@Autowired
	private IQuestionDao questionDao;

	@Override
	public List<Question> findList(String name, int start, int length) {
		String hql = "";
		if(StringUtils.isNotBlank(name)){
			hql += " and name like '%" + name + "%' ";
		}
		return questionDao.query(hql, start, length);
	}

	@Override
	public void delete(Integer id) {
		questionDao.delete(id);
	}

	@Override
	public Question getById(Integer id) {
		return questionDao.load(id);
	}

	@Override
	public void saveOrUpdate(Question question) {
		if(question.getId() > 0){
			questionDao.update(question);
			for(Answer answer : question.getAnswerList()){
				answer.setQuestion(question);
				answerDao.update(answer);
			}
		}else{
			questionDao.save(question);
			for(Answer answer : question.getAnswerList()){
				answer.setQuestion(question);
				answerDao.save(answer);
			}
		}
	}

	@Override
	public void deleteByIds(String ids) {
		String[] idArr = ids.split(",");
		for(String id : idArr){
			questionDao.delete(Integer.valueOf(id));
		}
	}

	@Override
	public int findCount(String name) {
		String hql = "";
		if(StringUtils.isNotBlank(name)){
			hql += " and name like '%" + name + "%' ";
		}
		return questionDao.countInt(hql);
	}
}