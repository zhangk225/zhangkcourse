package com.chinasofti.Actions;

public class UserLoginAction {

	private String name;

	private String password;

	public String execute() {

		if ("zhangk".equals(name) && "123456".equals(password)) {
			return "success";
		} else {
			return "error";
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
