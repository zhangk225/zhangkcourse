<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp page</title>
</head>
<body>
您：<span style="color : red;">${user.account }</span>登录失败！<br>
附加消息：<span style="color : green;">${message }</span><br>
</body>
</html>