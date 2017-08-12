package com.zhihu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhihu.dao.CollectMapper;
import com.zhihu.model.Collect;
import com.zhihu.model.CollectExample;
import com.zhihu.model.CollectExample.Criteria;

@Service
public class CollectService {

	@Autowired
	private CollectMapper collectMapper;
	
	//根据userId查询所有的收藏
	public List<Collect> selectCollectByUserId(Integer userId){
		CollectExample example = new CollectExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		List<Collect> collects = collectMapper.selectByExample(example);
		return collects;
		
	}
	
	//添加收藏
	public void addCollect(Collect collect) {
		collectMapper.insertSelective(collect);
	}
	
	//检查当前问题是否已收藏
	public boolean checkExist(Collect collect) {
		Collect dataCollect = collectMapper.selectByUserIdAndAnswerId(collect.getUserId(), collect.getAnswerId());
		if(dataCollect != null) {
			return true;
		}
		return false;
	}
}
