package com.chinasofti.Actions;

public class FirstAction {
	private String message;

	public String type1() {
		message="��һ����ת��ʽ:dispatcher";
		return "type1";
	}
	
	public String type2() {
		message="�ڶ�����ת��ʽ:chain";
		return "type2";
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
