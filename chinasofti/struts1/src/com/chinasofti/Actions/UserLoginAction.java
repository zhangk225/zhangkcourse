package com.chinasofti.Actions;

import com.chinasofti.db.UserDAO;

public class UserLoginAction {

	private UserBean user;

	private String message;

	public String execute() {
		UserDAO udao = new UserDAO();
		UserBean u = udao.findUserByAccount(user.getAccount());
		if (u != null) {
			if (u.getPassword().equals(user.getPassword())) {
				message = "密码错误";
			}
			message = "登录成功";
			return "success";
		} else {
			message = "用户名不存在";
			return "error";
		}
	}

	public UserBean getUser() {
		return user;
	}

	public void setUser(UserBean user) {
		this.user = user;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
