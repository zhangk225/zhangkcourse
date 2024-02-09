package com.chinasofti.Actions;

public class UserLoginAction {

	private UserBean user;
	
	public String execute() {
		
		if ("zhangk".equals(user.getName()) && "123456".equals(user.getPassword())) {
			return "success";
		} else {
			return "error";
		}
	}

	public UserBean getUser() {
		return user;
	}

	public void setUser(UserBean user) {
		this.user = user;
	}
	
}
