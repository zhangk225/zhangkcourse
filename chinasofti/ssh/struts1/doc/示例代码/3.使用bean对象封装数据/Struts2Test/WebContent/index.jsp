<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>第一个struts应用</title>
</head>
<body>
<s:property value="message"/><br/>
${message}
<form action="loginaction.action" >
用户名:<input name="user.name" type="text"/>

密码:<input name="user.password" type="password"/>

<input name="提交" value="登录" type="submit"/>
</form>


</body>
</html>