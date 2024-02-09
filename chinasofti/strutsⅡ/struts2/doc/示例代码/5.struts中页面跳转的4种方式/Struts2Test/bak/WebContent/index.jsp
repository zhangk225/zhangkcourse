<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp page</title>
</head>
<body>

1.以dispatcher方式访问jsp页面<br>
<form action="dispatcherAction.action" method="post">
要发送的值：<input type="text" name="strData" value="发送的值1" /><br>
<input type="submit" value="发送" />
</form>
<br><br>
<hr color="red">
<br><br>

2.以chain方式访问另一个Action
<form action="chainAction.action" method="post">
要发送的值：<input type="text" name="strData" value="发送的值2" /><br>
<input type="submit" value="发送" />
</form>
<br><br>
<hr color="red">
<br><br>

3.以redirect方式访问另一个jsp页面
<form action="redirectJsp.action" method="post">
要发送的值：<input type="text" name="strData" value="send data3" /><br>
<input type="submit" value="发送" />
</form>
<br><br>
<hr color="red">
<br><br>

4.以redirectAction方式访问另一个Action
<form action="redirectAction.action" method="post">
要发送的值：<input type="text" name="strData" value="发送的值4" /><br>
<input type="submit" value="发送" />
</form>

</body>
</html>