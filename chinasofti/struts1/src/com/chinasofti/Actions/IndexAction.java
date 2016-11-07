package com.chinasofti.Actions;

public class IndexAction {

	private String message;
	
	public String execute() {
		this.message="登录首页，第一个struts应用";
		System.out.println(message);
		return "success";
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
