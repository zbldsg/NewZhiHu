package com.zhihu.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
@RequestMapping("/question")
public class QuestionController {

	@Autowired
	private QuestionService questionService;

	@Autowired
	private AnswerService answerService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private CollectService collectService;

	@GetMapping("/{questionId}")
	public String getAnswer(@PathVariable("questionId") Integer questionId, @CookieValue(value = "phone",required = false) String phone,@CookieValue(value = "password",required = false) String password,Model model, HttpSession session) {
		if(phone != null && password != null) {
			User user = userService.getUser(phone);
			model.addAttribute("user", user);
			model.addAttribute("questionId", questionId);
			return "answer-login";
		} else {
			String sessionPhone = (String) session.getAttribute("phone");
			if (sessionPhone != null) {
				User user = userService.getUser(sessionPhone);
				model.addAttribute("user", user);
				model.addAttribute("questionId", questionId);
				return "answer-login";
			}
		}
		model.addAttribute("questionId", questionId);
		return "answer";
	}

	@RequestMapping(value="/jsonAnswer",produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public Msg jsonAnswer(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
			@RequestParam(value = "questionId") Integer questionId) {

		// 查询问题
		Question question = questionService.selectQuestion(questionId);
		// 查询问题下面的所有回答
		List<Answer> answerList = answerService.getAllByQuestionId(questionId);

		PageHelper.startPage(pageNum, 10);
		// 用pageInfo包装一下,pageInfo封装了我们查询的所有信息，而且有一些方法很方便
		PageInfo page = new PageInfo(answerList, 10);
		return Msg.success().add("pageInfo", page).add("question", question);
	}
	
	@RequestMapping(value="/jsonAnswerAndCollect",produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public Msg jsonAnswerAndCollect(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,@RequestParam(value = "questionId") Integer questionId,@RequestParam("userId") Integer userId) {

		// 查询问题
		Question question = questionService.selectQuestion(questionId);
		// 查询问题下面的所有回答
		List<Answer> answerList = answerService.getAllByQuestionId(questionId);
		
		//查询当前的用户的所有收藏
		List<Collect> collects = collectService.selectCollectByUserId(userId);
		
		PageInfo collectPage = new PageInfo(collects);
		
		PageHelper.startPage(pageNum, 10);
		PageInfo page = new PageInfo(answerList, 10);
		
		return Msg.success().add("pageInfo", page).add("question", question).add("collectPage", collectPage);

	}

	// 提交问题的ajax请求处理包含描述
	@RequestMapping(value = "/questionTopicDesc", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String questionTopicDesc(Question question, HttpSession session, Model model) {
		// 从session中拿到用户手机号，通过service获取user
		String phone = (String) session.getAttribute("phone");
		User user = userService.getUser(phone);

		// 将从数据库取到的userId存入到question中
		question.setUserId(user.getId());
		System.out.println(question);

		// 调用service存储question,如果储存失败就返回0,正确就返回问题的id
		Integer id = questionService.saveQuestion(question);
		
		// 不等于0说明成功了，
		if (id != 0) {
			//将id转为字符串然后返回
			String questionId = id + "";
			return questionId;
		}
		return "0";
	}

	// 提交问题的ajax请求处理不包含描述
	@RequestMapping(value = "/questionTopic", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String questionTopic(Question question, HttpSession session, Model model) {

		// 从session中拿到用户手机号，通过service获取user
		String phone = (String) session.getAttribute("phone");
		User user = userService.getUser(phone);

		// 将从数据库取到的userId存入到question中
		question.setUserId(user.getId());
		System.out.println(question);

		// 调用service存储question,如果储存失败就返回0,正确就返回问题的id
		Integer id = questionService.saveQuestion(question);
		
		// 不等于0说明成功了，
		if (id != 0) {
			//将id转为字符串然后返回
			String questionId = id + "";
			return questionId;
		}
		return "0";
	}
	
	@PostMapping("/{questionId}/answer")
	public String addAnswer(@PathVariable("questionId") Integer questionId, String answerContent, HttpSession session) {
		
		String phone = (String) session.getAttribute("phone");
		User user = userService.getUser(phone);
		Question question = questionService.selectQuestion(questionId);
		
		Answer answer = new Answer();
		answer.setUserId(user.getId());
		answer.setUserName(user.getName());
		answer.setQuestionId(questionId);
		answer.setQuestion(question.getTitle());
		
		//如果回答大于100个字就设置part字段，如果不超过就不用储存了。
		if(answerContent.length() > 200) {
			answer.setPart(answerContent.trim().substring(0, 200));
		} 
		answer.setContent(answerContent);
		answer.setDateTime(new Date());
		boolean success = answerService.saveAnswer(answer);
		if(success) {
			return "redirect:/question/" + questionId;
		}
		return "fail";
		
	}
}
