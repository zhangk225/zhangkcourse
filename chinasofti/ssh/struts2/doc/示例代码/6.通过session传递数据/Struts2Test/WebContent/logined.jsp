<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp page</title>
</head>
<body>
恭喜您：<span style="color : blue;">${user.username }</span><br>
附加消息：<span style="color : green;">${retMessage }</span><br>
</body>
</html>