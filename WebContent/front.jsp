<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>DGF::Main</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/auth.js"></script>
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

	function showLoginDialog() {
		$("#loginDialog").css("visibility", "visible");
	}

	function notLogin() {
		$("#loginDialog").css("visibility", "hidden");
	}

	
</script>
<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/reset.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/front.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/loginBox.css">
<style type="text/css">
	body {
		font-family: 'Arca Majora 3 Heavy';
		src: url(font/ArcaMajora3-Heavy.otf);
	}

	#loginDialog {
		background-color: rgba(0, 0, 0, 0.3);
		width: 100%;
		height: 100%;
		position: fixed;
		z-index: 1;
		margin: 0;
		padding: 0;
		top: 0px;
		visibility: hidden;
	}
	
	.loginBox{
		margin-top:300px;
		background-color: rgba(0,0,0,0.6);
	}
	
	.loginBox p{
		margin:20px;
	}
	
	.loginBox p input{
		height:50px;
		background-color: rgba(0,0,0,0.9);
	}
	
	.loginBox .inpJoin{
		background-color: rgba(0,0,0,0.9);
		margin:10px;
	}

</style>
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