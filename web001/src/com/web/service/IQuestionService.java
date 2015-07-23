package com.web.service;

import java.util.List;

import com.web.entity.Question;

public interface IQuestionService {

	List<Question> findList(String name, int startIndex, int pageSize);

	int findCount(String name);
	
	Question getById(Integer id);

	void saveOrUpdate(Question question);

	void delete(Integer id);

	void deleteByIds(String ids);
}
