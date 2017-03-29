<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>DGF::Main</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/loginBox.css">
<link rel="stylesheet" type="text/css" href="css/front.css">
<link rel="stylesheet" type="text/css" href="css/community.css">

<style type="text/css">
@font-face {
	font-family: 'Arca Majora 3 Heavy';
	src: url(font/ArcaMajora3-Heavy.otf);
}

body {
	font-family: 'Arca Majora 3 Heavy';
	src: url(font/ArcaMajora3-Heavy.otf);
}

body{
		font-family: font-family: 'Arca Majora 3 Heavy','12롯데마트행복Medium' !important;
	}
#nAndl{
	width:100%;
	display: none;
}
</style>

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

<title>DGF::Main</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/auth.js"></script>
<script src="js/front.js"></script>
</head>
<body>
	<div id="loginDialog">
		<jsp:include page="WEB-INF/view/login.jsp"></jsp:include>
	</div>
	<div id="container">
		<div id="header">
			<div id="hWrap">
				<div id="nav">
					<jsp:include page="template/nav.jsp"></jsp:include>
				</div>
	
				<div id="login">
					<jsp:include page="template/login.jsp"></jsp:include>
				</div>
			</div>
			<div id="nAndl">
				<jsp:include page="template/nav.jsp"></jsp:include>			
				<jsp:include page="template/login.jsp"></jsp:include>
			</div>
		</div>

		<div id="title">
			<jsp:include page="template/title.jsp"></jsp:include>
		</div>

		<div id="content">
			<jsp:include page="template/home.jsp" ></jsp:include>
		</div>

		<%-- <div id="footer">
			<jsp:include page="template/footer.jsp"></jsp:include>
		</div> --%>
	</div>
</body>
</html>