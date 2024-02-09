package com.chinasofti.Actions;

public class SendData {

	private String strData;

	private String param1;

	private String param2;

	public String execute() {
		System.out.println("chainData:strData={" + strData + "},param1={" + param1 + "},param2={" + param2 + "}");
		return "success";
	}

	public String getStrData() {
		return strData;
	}

	public void setStrData(String strData) {
		this.strData = strData;
	}

	public String getParam1() {
		return param1;
	}

	public void setParam1(String param1) {
		this.param1 = param1;
	}

	public String getParam2() {
		return param2;
	}

	public void setParam2(String param2) {
		this.param2 = param2;
	}

}
