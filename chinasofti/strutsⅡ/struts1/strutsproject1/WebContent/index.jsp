<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>my jsp page</title>
</head>
<body>

<form action="login.action" method="post">
用户名：<input type="text" name="user.account" /><br>
密码：<input type="password" name="user.password" /><br>
<input type="submit" value="登录" /> <a href="register.jsp">注册</a>
</form>

</body>
</html>