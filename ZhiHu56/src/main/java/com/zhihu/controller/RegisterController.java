package com.zhihu.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhihu.model.User;
import com.zhihu.service.UserService;

@Controller
@RequestMapping("/register")
public class RegisterController {

	@Autowired
	private UserService userService;

	// 手机号检查ajax,防止出现乱码后面加上produces
	@RequestMapping(value = "/phoneCheck", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String checkPhone(@Param("phone") String phone) {
		boolean legal = userService.checkPhone(phone);
		if (legal) {
			return "1";
		}
		return "0";
	}

	// 注册检查ajax
	@RequestMapping(value = "/registerCheck", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String checkRegister(User user, HttpSession session) {
		boolean success = userService.saveUser(user);
		if (success) {
			// 如果用户注册成功就将手机号和密码放入到session中
			session.setAttribute("phone", user.getPhone());
			session.setAttribute("password", user.getPassword());
			session.setMaxInactiveInterval(30*60);
			return "1";
		}
		return "0";
	}

}
