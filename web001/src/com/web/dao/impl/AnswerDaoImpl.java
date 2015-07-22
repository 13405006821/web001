package com.web.dao.impl;

import org.springframework.stereotype.Repository;

import com.base.dao.impl.BaseDaoImpl;
import com.web.dao.IAnswerDao;
import com.web.entity.Answer;

@SuppressWarnings("unchecked")
@Repository("answerDao")
public class AnswerDaoImpl extends BaseDaoImpl<Answer> implements IAnswerDao {

}
