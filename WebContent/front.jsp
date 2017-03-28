<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>DGF::Main</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/auth.js"></script>
<script src="js/front.js"></script>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/loginBox.css">
<link rel="stylesheet" type="text/css" href="css/front.css">
<link rel="stylesheet" type="text/css" href="css/community.css">

</head>
<body>
	<div id="loginDialog">
		<jsp:include page="WEB-INF/view/login.jsp"></jsp:include>
	</div>
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
			<jsp:include page="template/home.jsp"></jsp:include>
		</div>

		<div id="footer">
			<jsp:include page="template/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>