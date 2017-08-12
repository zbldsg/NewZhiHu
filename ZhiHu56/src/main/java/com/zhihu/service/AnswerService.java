package com.zhihu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhihu.dao.AnswerMapper;
import com.zhihu.model.Answer;
import com.zhihu.model.AnswerExample;
import com.zhihu.model.AnswerExample.Criteria;

@Service
public class AnswerService {

	@Autowired
	private AnswerMapper answerMapper;
	
	//根据主键查询回答
	public Answer selectAnswerByPrimaryKey(Integer id) {
		return answerMapper.selectByPrimaryKey(id);
	}
	
	
	//根据用户id查询回答
	public List<Answer> selectAnswerByUserId(Integer userId){
		AnswerExample example = new AnswerExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		List<Answer> answers = answerMapper.selectByExampleWithBLOBs(example);
		return answers;
	}

	// 添加点赞
	public Integer addLike(Integer id) {
		// 取得数据库对应回答的answer
		Answer answer = answerMapper.selectByPrimaryKey(id);
		// 取得点赞数量,并加一
		Integer newLikeNum = answer.getLikeNum() + 1;

		// 创建一个新的answer实体，只设置id和like字段，这样使用updateByPrimaryKeySelective，只会更新likeNum字段。
		Answer newAnswer = new Answer();
		newAnswer.setId(id);
		newAnswer.setLikeNum(newLikeNum);
		answerMapper.updateByPrimaryKeySelective(newAnswer);
		return newAnswer.getLikeNum();
	}

	// 添加点踩
	public Integer addHate(Integer id) {
		// 取得数据库对应回答的answer
		Answer answer = answerMapper.selectByPrimaryKey(id);
		// 取得点赞数量,并加一
		Integer newHateNum = answer.getHateNum()+1;
		
		//创建一个新的answer
		Answer newAnswer = new Answer();
		newAnswer.setId(id);
		newAnswer.setHateNum(newHateNum);
		//根据主键查找，并且只更新hateNum字段
		answerMapper.updateByPrimaryKeySelective(newAnswer);
		
		return newAnswer.getHateNum();
	}

	//获取所有回答
	public List<Answer> getAll() {
		return answerMapper.selectByExampleWithBLOBs(null);

	}

	//根据问题获取问题下的所有回答
	public List<Answer> getAllByQuestionId(Integer questionId) {
		AnswerExample example = new AnswerExample();
		Criteria criteria = example.createCriteria();
		criteria.andQuestionIdEqualTo(questionId);
		List<Answer> answers = answerMapper.selectByExampleWithBLOBs(example);
		return answers;
	}

	//保存回答
	public boolean saveAnswer(Answer answer) {
		int success = answerMapper.insertSelective(answer);
		if (success != 0) {
			return true;
		}
		return false;

	}

}
