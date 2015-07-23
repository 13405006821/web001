package com.web.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.entity.Question;
import com.web.service.IQuestionService;

@Service("questionService")
public class QuestionServiceImpl implements IQuestionService {

	@Override
	public List<Question> findList(String name, int startIndex, int pageSize) {
		return null;
	}

	@Override
	public int findCount(String name) {
		return 0;
	}

	@Override
	public void saveOrUpdate(Question question) {
	}

	@Override
	public void delete(String id) {
	}

	@Override
	public void deleteByIds(String ids) {
	}
}