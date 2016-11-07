package com.chinasofti.Actions;

import com.chinasofti.db.UserDAO;

public class RegisterAction {

	private UserBean user;

	private String message;

	public String execute() {
		UserDAO udao = new UserDAO();
		boolean flag = udao.saveUser(user);
		if (flag) {
			message = "注册成功";
			return "success";
		} else {
			message = "注册失败";
			return "false";
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
