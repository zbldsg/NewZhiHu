package com.zhihu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhihu.dao.UserMapper;
import com.zhihu.model.User;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;

	// 通过传入的手机号检查用户是否存在，用于验证登录信息的手机号
	public boolean checkPhone(String phone) {
		User user = userMapper.selectByPhone(phone);
		
		if (user != null) {
			return true;
		}
		return false;
	}

	// 通过传入的user检查用户是否合法，用于验证登录信息的密码
	public boolean checkUser(User user) {
		User dataUser = null;
		//先通过手机号查询，如果能查到，说明用户存在
		if ((dataUser = userMapper.selectByPhone(user.getPhone())) != null) {
			//传入的用户密码
			String password = user.getPassword();
			//从数据库根据手机号查询出来的密码
			String dataPassword = dataUser.getPassword();
			//如果密码和数据库的密码一直就返回true
			if (password.equals(dataPassword)) {
				return true;
			}
		}
		return false;
	}

	public boolean saveUser(User user) {
		int success = userMapper.insertSelective(user);
		if (success == 0) {
			return false;
		}
		return true;
	}

	public User getUser(String phone) {
		User user = userMapper.selectByPhone(phone);
		return user;
	}
	
	public User getUser(Integer id) {
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}
	
	//修改用户信息
	public boolean changeUserMessage(User user) {
		int success = userMapper.updateByPrimaryKeySelective(user);
		if(success != 0) {
			return true;
		}
		return false;
	}
}
