<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css?ver=2">
<link rel="stylesheet" type="text/css" href="css/reset.css?ver=2">
<link rel="stylesheet" type="text/css" href="css/front.css?ver=2">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	function movepage(obj) {
		var page = $(obj).html();
		$.ajax({ 
			url : "movePage.do",
			type : "get",
			data : {
				"page" : page
			},
			dateType : "html",
			success : function(result) {
				$("#content").html(result);
			}
		});
	}
</script>
<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/reset.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/front.css?ver=1">
<style type="text/css">
@font-face {
	font-family: 'Arca Majora 3 Heavy';
	src: url(font/ArcaMajora3-Heavy.otf);
}

body {
	font-family: 'Arca Majora 3 Heavy';
	src: url(font/ArcaMajora3-Heavy.otf);
}
</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<div id="nav">
				<jsp:include page="template/nav.jsp"></jsp:include>
			</div>

			<div id="login">
				<jsp:include page="template/login.jsp"></jsp:include>
			</div>
		</div>

		<div id="title">
			<jsp:include page="template/title.jsp"></jsp:include>
		</div>

		<div id="content">
			<c:forEach	var="item" items="frontList">
				<a>${file.aname }</a>
			
			</c:forEach>
		</div>

		<div id="footer">
			<jsp:include page="template/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>