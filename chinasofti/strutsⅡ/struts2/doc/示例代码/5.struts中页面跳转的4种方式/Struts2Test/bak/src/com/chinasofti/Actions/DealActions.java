package com.chinasofti.Actions;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.util.ValueStack;

public class DealActions {
	private String strData;
	private String type;
	
	public String doAction()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		ValueStack vs = (ValueStack)request.getAttribute("struts.valueStack");
		String strDataStack = (String)vs.findValue("strData");
		String strDataRequest = (String)request.getAttribute("strData");

		//String对象已经重写了toString()，所以我们需要借用Object.toString()中的源码来打印对象虚地址
		System.out.print("strData在struts的valueStack中的值为：" + strDataStack + "。地址为：");
		System.out.println(strDataStack.getClass().getName() + "@" + Integer.toHexString(strDataStack.hashCode()));
		System.out.print("strData在struts的request中的值为：" + strDataRequest + "。地址为：");
		System.out.println(strDataRequest.getClass().getName() + "@" + Integer.toHexString(strDataRequest.hashCode()));
		
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
