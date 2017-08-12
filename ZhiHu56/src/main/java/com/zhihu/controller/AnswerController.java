package com.zhihu.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhihu.model.Collect;
import com.zhihu.service.AnswerService;
import com.zhihu.service.CollectService;

@Controller
@RequestMapping("/answer")
public class AnswerController {
	
	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private CollectService collectService;
	
	@RequestMapping(value="/addLike", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String addLike(@Param("id") Integer id) {
		Integer likeNum = answerService.addLike(id);
		return likeNum + "";
	}
	
	@RequestMapping(value="/addHate", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String addHate(@Param("id") Integer id) {
		Integer hateNum = answerService.addHate(id);
		return hateNum + "";
	}
	
	@RequestMapping(value="/collect", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String addCollect(@Param("answerId") Integer answerId,@Param("userId") Integer userId) {
		Collect collect = new Collect();
		collect.setUserId(userId);
		collect.setAnswerId(answerId);
		
		//如果返回false说明存在
		if(collectService.checkExist(collect)) {
			return "已收藏";
		} else {
			collectService.addCollect(collect);
			return "已收藏";
		}
	}
	
}
