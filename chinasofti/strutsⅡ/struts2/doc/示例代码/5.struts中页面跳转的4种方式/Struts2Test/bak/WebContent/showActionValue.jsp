<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp page</title>
</head>
<body>

request对象获取值：type:<%=request.getAttribute("type") %><br>
strData:${request.strData }<br>

<c:if test="${!empty type && !empty strData }">
通过内置对象发来的值为：<br>
跳转的方式：${type }<br>
发来的值为：${strData }<br>
</c:if>

<c:if test="${!empty param.type && !empty param.strData }">
通过参数发来的值为：<br>
跳转的方式：${param.type }<br>
发来的值为：${param.strData }<br>
</c:if>

</body>
</html>