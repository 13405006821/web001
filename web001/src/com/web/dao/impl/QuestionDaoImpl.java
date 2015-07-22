package com.web.dao.impl;

import org.springframework.stereotype.Repository;

import com.base.dao.impl.BaseDaoImpl;
import com.web.dao.IQuestionDao;
import com.web.entity.Question;

@SuppressWarnings("unchecked")
@Repository("questionDao")
public class QuestionDaoImpl extends BaseDaoImpl<Question> implements IQuestionDao {

}
