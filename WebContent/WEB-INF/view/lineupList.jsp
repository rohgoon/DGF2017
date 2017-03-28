<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/common.css">
<style type="text/css">
	/*-------------------------- div type list css --------------------------*/
	.outter{
		width: 100%;
		height: 800px;
		padding-top: 50px;
	}
	
	.test{
		width: 100%;
		height: 800px;
		padding-top: 50px;
	}
	
	.inner{
		width: 550px;
		height: 650px;
		background-color: rgba( 255, 255, 255, 0.9);
		padding: 10px;
		margin-left: 1200px;
	}
	
	.aname{
		width: 97%;
		height: 70px;
		clear: both;
		padding: 10px;
	}
	
	.aname a{
		font-size: 40px;
		color:#000000;
	}
	
	.contents{
		width: 320px;
		height: 530px;
		display: inline;
		float: left;
		padding: 10px;
	}
	
	.song{
		width: 180px;
		height: 530px;
		display: inline;
		float: right;
		border-left: 1px solid #000000;
		padding: 10px;
	}
	
	.song a{
		display: block;
	}
	
	/*-------------------------- day nav bar css --------------------------*/
	.dayNav{
		width: 70px;
		height: 100px;
		position: fixed;
		bottom: 300px;
		padding: 10px;
		border-top-right-radius: 20px;
		border-bottom-right-radius: 20px;
		border: 1px solid #FF4081;
		color: #000000;
		background-color: rgba( 255, 255, 255, 0.9);
		box-shadow: 3px 3px 0px #4C4C4C;
	}
	
	.dayNav a{
		font-size: 20px;
		display: block;
		margin-bottom: 20px;
	}
	
	.dayNav a:HOVER {
		color: #FF4081;
		background-size: cover;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<div id="container">

	<div id="content">
	<!------------------------------- div type list ------------------------------->
	<c:forEach var="item" items="${viewList }">
		<div class="outter">
			<div class="inner">
				<div class="aname">
					<a>${item.aname }</a>
				</div>
				
				<div class="contents">
					<a>${item.contents }</a>
				</div>
				
				<div class="song">
					<a>1. ${item.song1 }</a>
					<a>2. ${item.song2 }</a>
					<a>3. ${item.song3 }</a>
				</div>
				
				
			</div>
		</div>
		
		<script type="text/javascript">
			$(function(){
				var i = 0;
				<c:forEach var="item" items="${viewList }">
					$(".outter").eq(i).css("background-image", "url(upload/${item.file})");
					$(".outter").eq(i).css("background-size", "cover");
					i++;
				</c:forEach>	
			});
		</script>
		
	</c:forEach>
	
	</div>
	
	<!------------------------------- day nav bar ------------------------------->
	<div class="dayNav">
		<a id="dayNav1">DAY1</a>
		<a id="dayNav2">DAY2</a>
		<a id="dayNav3">DAY3</a>
	</div>
	
</div>
</body>
</html>