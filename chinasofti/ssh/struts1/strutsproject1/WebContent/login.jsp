<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>my jsp page</title>
</head>
<body>
恭喜您：<span style="color : blue;">${user.name }</span><br>
附加消息：<span style="color : green;">${message }</span><br>
</body>
</html>