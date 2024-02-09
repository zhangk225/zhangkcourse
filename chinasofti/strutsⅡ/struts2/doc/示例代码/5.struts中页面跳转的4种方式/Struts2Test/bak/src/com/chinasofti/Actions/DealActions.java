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

		//String�����Ѿ���д��toString()������������Ҫ����Object.toString()�е�Դ������ӡ�������ַ
		System.out.print("strData��struts��valueStack�е�ֵΪ��" + strDataStack + "����ַΪ��");
		System.out.println(strDataStack.getClass().getName() + "@" + Integer.toHexString(strDataStack.hashCode()));
		System.out.print("strData��struts��request�е�ֵΪ��" + strDataRequest + "����ַΪ��");
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
