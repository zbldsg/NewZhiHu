package com.zhihu.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhihu.model.User;
import com.zhihu.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserService userService;
	
	//登出功能
	@RequestMapping("/out")
	public String out(HttpSession session,@CookieValue(value = "phone",required = false) String phone,@CookieValue(value = "password",required = false) String password) {
		//先删除session
		session.removeAttribute("phone");
		session.removeAttribute("password");
		if(phone != null || password != null){
			
			Cookie cookiePhone = new Cookie("phone",null);
			cookiePhone.setMaxAge(0);
			cookiePhone.setPath("/");
			
			Cookie cookiePassword = new Cookie("password",null);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath("/");
		}
		return "home";
	}
	
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

	// 登录检查ajax
	@RequestMapping(value = "/loginCheck", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String checkLogin(User user, HttpSession session) {
		boolean legal = userService.checkUser(user);
		if (legal) {
			// 如果用户合法就将用户名和密码放入到session中
			session.setAttribute("phone", user.getPhone());
			session.setAttribute("password", user.getPassword());
			session.setMaxInactiveInterval(30*60);
			return "1";
		}
		return "0";
	}
}
