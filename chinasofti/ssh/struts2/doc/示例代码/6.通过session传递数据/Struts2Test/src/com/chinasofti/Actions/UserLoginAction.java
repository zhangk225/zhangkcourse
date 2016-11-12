package com.chinasofti.Actions;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.chinasofti.beans.User;

public class UserLoginAction {
	private User user;
	private String retMessage;
	public String login()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		ServletContext application = request.getServletContext();
		
		if(user.getUsername().equals("zhangsan"))
		{
			if(user.getPassword().equals("123456"))
			{
				retMessage = "登陆成功！";
				
				session.setAttribute("user", user);
				session.setAttribute("retMessage", retMessage);
				
				return "success";
			}else
			{
				retMessage = "密码错误！";
				
				session.setAttribute("user", user);
				session.setAttribute("retMessage", retMessage);
				
				return "error";
			}
		}
		
		retMessage = "用户不存在！";
		session.setAttribute("retMessage", retMessage);
		return "error";
	}
	
	public String getRetMessage() {
		return retMessage;
	}
	public void setRetMessage(String retMessage) {
		this.retMessage = retMessage;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
