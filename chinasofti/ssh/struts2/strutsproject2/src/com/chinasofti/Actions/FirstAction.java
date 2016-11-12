package com.chinasofti.Actions;

public class FirstAction {
	private String message;

	public String type1() {
		message="第一种跳转方式:dispatcher";
		return "type1";
	}
	
	public String type2() {
		message="第二种跳转方式:chain";
		return "type2";
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
