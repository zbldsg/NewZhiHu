package com.zhihu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhihu.dao.QuestionMapper;
import com.zhihu.model.CollectExample;
import com.zhihu.model.Question;
import com.zhihu.model.QuestionExample;
import com.zhihu.model.QuestionExample.Criteria;

@Service
public class QuestionService {

	@Autowired
	private QuestionMapper questionMapper;

	public Integer saveQuestion(Question question) {
		Integer questionId = questionMapper.insertResponseId(question);
		return questionId;
	}

	public Question selectQuestion(Integer questionId) {
		Question question = questionMapper.selectByPrimaryKey(questionId);
		return question;
	}
	
	public List<Question> selectQuestionByUserId(Integer userId) {
		QuestionExample example = new QuestionExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		List<Question> questions = questionMapper.selectByExample(example);
		
		//List<Question> questions = questionMapper.selectByUserId(userId);
		return questions;
	}
	
	public List<Question> selectQuestionByUserIdExample(Integer userId) {
		QuestionExample questionExample = new QuestionExample();
		Criteria criteria = questionExample.createCriteria();
		criteria.andUserIdEqualTo(userId);
		List<Question> questions = questionMapper.selectByExample(questionExample);
		return questions;
	}
	
	
}
