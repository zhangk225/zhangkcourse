package com.chinasofti.Actions;

public class ChainAction {
	private String strData;
	private String type;
	
	public String doOtherAction()
	{
		return "success";
	}
	
	public String getStrData() {
		return strData;
	}
	public void setStrData(String strData) {
		this.strData = strData;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getType() {
		return type;
	}
}
