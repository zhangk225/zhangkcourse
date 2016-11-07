<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册页面</title>
</head>
<body>
会员注册<br/>
<form action="register.action" method="post"><br/>
用户账号:<input name="user.account" type="text"/><br/>
设置密码:<input name="user.password" type="password"/><br/>
确认密码:<input name="user.confirmPassword" type="password"/><br/>
用户姓名:<input name="user.name" type="text"/><br/>
身份证号:<input name="user.identityId" type="text"/><br/>
性别: <input name="user.sex" type="radio" value="man"/>男    <input name="user.sex" type="radio" value="woman"/>女<br/>
手机号码:<input name="user.phone" type="text"/><br/>

<input type="submit" value="同意服务条款请点击注册" />

</form>
</body>
</html>