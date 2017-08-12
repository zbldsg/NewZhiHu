package com.zhihu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
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
@RequestMapping("/zhihu")
public class ZhihuController {

	@Autowired
	private AnswerService answerService;

	@Autowired
	private UserService userService;

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private CollectService collectService;

	// json请求处理-未登录
	@RequestMapping(value="/jsonQuestion",produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public Msg getHome(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
		// 传入的页码和每页显示的记录数
		PageHelper.startPage(pageNum, 10);

		// 查询所有记录
		List<Answer> answerList = answerService.getAll();

		// 用pageInfo包装一下,pageInfo封装了我们查询的所有信息，而且有一些方法很方便
		PageInfo page = new PageInfo(answerList, 10);

		return Msg.success().add("pageInfo", page);
	}
	
	// json请求处理-已登录
	@RequestMapping(value="/loginJsonQuestion",produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public Msg getLoginHome(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,@RequestParam("userId") Integer userId) {
		
		PageHelper.startPage(pageNum, 10);
		// 查询所有记录
		List<Answer> answers = answerService.getAll();
		//查询当前的用户的所有收藏
		List<Collect> collects = collectService.selectCollectByUserId(userId);
		//将查询的记录装入到pageInfo中
		PageInfo answerPage = new PageInfo(answers);
		PageInfo collectPage = new PageInfo(collects);
		
		return Msg.success().add("answerPage", answerPage).add("collectPage", collectPage);
	}

	// 检查是否登录，如果登录就转到已登录页，否则转到未登录页
	@RequestMapping("/home")
	public String getList(@CookieValue(value = "phone",required = false) String phone,@CookieValue(value = "password",required = false) String password,HttpSession session, Model model) {
		//首先从cookie检查，如果有就写入model里，并返回登录页
		if(phone != null && password != null) {
			User user = userService.getUser(phone);
			model.addAttribute("user", user);
			return "home-login";
			//接下来如果cookie没有就从session中找，如果有就转入登录页
		} else {
			String sessionPhone = (String) session.getAttribute("phone");
			if (sessionPhone != null) {
				User user = userService.getUser(sessionPhone);
				model.addAttribute("user", user);
				return "home-login";
			}
		}
		//如果都没有就转入未登录的home页
		return "home";
	}

	// 转到注册页面
	@RequestMapping("/register")
	public String getRegister() {
		return "register";
	}

	// 转到登录页面
	@RequestMapping("/login")
	public String getLogin() {
		return "login";
	}

}
