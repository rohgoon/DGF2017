<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One|Julius+Sans+One|Monoton" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/loginBox.css">
<style>
@font-face {
	font-family: 'Arca Majora 3 Heavy';
	 src:url(font/ArcaMajora3-Heavy.otf); 
	} 
</style>
<meta charset="UTF-8">
<title>DGF::Daegu Girl-Group Festival Intro</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/auth.js"></script>
</head>
<body>
	<%	int vNum = (int) (Math.round(Math.random() * 3 + 1)); %>
	<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
		<source src="video/<%=vNum%>.ogv" type="video/ogg">
	</video>
	<div id="wrapContent">
		<h1>
			Daegu<br>
			<span id="t2">Girl-group</span><br>
			<span id="t3">Festival</span>
		</h1>
		<div id="innerWrap">
			<jsp:include page="WEB-INF/view/login.jsp"></jsp:include>
		</div>

	</div>
</body>
</html>