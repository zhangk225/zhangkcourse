<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.chinasofti.Actions.*,java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我喜爱的音乐</title>
</head>
<body>
	<%
		List<MusicBean> musics = (List<MusicBean>) request.getAttribute("musics");//allMusic被struts放在了request当中
		System.out.println(musics);
	%>
	<table>
		<tr width="70%" height="30">
			<td width="4%">序号</td>
			<td width="20%">歌曲名称</td>
			<td width="20%">歌手名称</td>
			<td width="10%">歌曲大小</td>
			<td width="10%">试听</td>
			<td width="10%">下载</td>
			<td width="6%">操作</td>
		</tr>
		<c:forEach var="music" items="${musics}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${music.musicName}</td>
				<td>${music.musicSinger}</td>
				<td>${music.musicSize}</td>
				<td>暂无</td>
				<td>暂无</td>
				<td><a href="music!deleteMusic.action?musicNo=${music.musicNo}">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>