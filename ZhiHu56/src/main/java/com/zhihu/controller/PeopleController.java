package com.zhihu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhihu.model.Answer;
import com.zhihu.model.Collect;
import com.zhihu.model.Msg;
import com.zhihu.model.Question;
import com.zhihu.model.User;
import com.zhihu.service.AnswerService;
import com.zhihu.service.CollectService;
import com.zhihu.service.QuestionService;
import com.zhihu.service.UserService;

@Controller
@RequestMapping("/people")
public class PeopleController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private CollectService collectService;
	
	//跳转到个人页
	@GetMapping("/{id}")
	public String getMine(@CookieValue(value = "phone",required = false) String phone,@CookieValue(value = "password",required = false) String password,HttpSession session, @PathVariable("id") Integer id,Model model) {
		//根据传入的id查询user
		User user = userService.getUser(id);
		
		//首先从cookie检查,如果传入的用户id跟cookie中的id一样，判断是本人，进入本人页
		if(phone != null && password != null) {
			if(user.getPhone() == phone && user.getPassword() == password) {
				model.addAttribute("user", user);
				return "people";
			} 
			//如果不是本人，进入其他人页
			model.addAttribute("user", user);
			return "peopleOther";
		} else {
			//如果cookie是空，就从session中找
			String sessionPhone = (String) session.getAttribute("phone");
			//如果不为空，就说明已登录
			if (sessionPhone != null) {
				//根据session中的phone查找用户
				User Sessionuser = userService.getUser(sessionPhone);
				//判断从session中的用户与传入的userId是否一样，如果一样是本人
				if(Sessionuser.getId() == id) {
					model.addAttribute("user", user);
					return "people";
				}
				model.addAttribute("user", user);
				return "peopleOther";
			}
			//如果cookie和session都是空，说明没有登录转入其他用户页
			model.addAttribute("user", user);
			return "peopleOther";
		}
	}
	
	@RequestMapping(value="/userAllMessage",produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public Msg userAllMessage(@RequestParam(value = "userId") Integer userId) {
		List<Question> questions = questionService.selectQuestionByUserIdExample(userId);
		List<Answer> answers = answerService.selectAnswerByUserId(userId);
		List<Collect> collects = collectService.selectCollectByUserId(userId);
		
		PageHelper.startPage(1, 10);
		PageInfo questionPage = new PageInfo(questions);
		PageInfo answerPage = new PageInfo(answers);
		
		//判断这个用户是否有收藏
		if(collects != null) {
			//如果有就遍历收藏的回答id，添加到收藏List的answerByCollects
			List<Answer> answerByCollects = new ArrayList<Answer>();
			for( int i = 0 ; i < collects.size() ; i++) {
			    Collect collect = collects.get(i);
			    Integer answerId = collect.getAnswerId();
			    Answer answer =  answerService.selectAnswerByPrimaryKey(answerId);
			    answerByCollects.add(answer);
			}
			PageInfo collectAnswerPage = new PageInfo(answerByCollects);
			return Msg.success().add("questionPage", questionPage).add("answerPage", answerPage).add("collectAnswerPage", collectAnswerPage);
		}
		return Msg.success().add("questionPage", questionPage).add("answerPage", answerPage);
	}
	
	
	//修改用户名及个性签名，密码
	@RequestMapping("/changeUserMessage")
	public String changeUserMessage(@RequestParam(value = "userId") Integer userId,@RequestParam(value = "userName",required = false) String userName,
			@RequestParam(value = "userPassword",required = false) String userPassword,@RequestParam(value = "userSignature",required = false) String userSignature) {
		
		//从数据库取得user
		User user = new User();
		user.setId(userId);

		if(userName != null) {
			user.setName(userName);
			
		} else if(userPassword != null) {
			user.setPassword(userPassword);
			
		} else if(userSignature != null) {
			user.setSignature(userSignature);
		}
		
		boolean success = userService.changeUserMessage(user);
		if(success) {
			return "1";
		}
		return "0";
	}
}





