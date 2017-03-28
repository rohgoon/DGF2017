<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	#innerNav{
		width: 350px;
		height: auto;	
		text-align: center;
		font-size: 3.5em;		
		font-family: 'Hanna', serif;
		float: left;
		border-right: #F48FB1 solid 2px;
	}
	#innerNav a{
		display: inline-block;
		
		width: 100%;
		height: 100px;
		color: #F48FB1;
		text-decoration: none;
		padding-top: 40px;
		letter-spacing: 10px;
	}
	#subNav{
		/* border: blue solid 1px; */
		height: auto;
		opacity: 0;
	}
	#subNav a.subNav{
		display: inline-block;
		background-color: #F48FB1;
		width: 20%;
		height: 40px;	
		margin-bottom:10px;
		color: white;
		text-decoration: none;
		padding-top: 20px;
		letter-spacing: 10px;
		font-family: 'Hanna', serif;
		font-size: 1.5em;	
		text-align: right;	
	}
	#subNav a.subNav:HOVER{
		opacity: 0.5;
	}
	#innerContent{
		/* border: 1px solid blue; */
		margin-left: 350px;
		width: 1350px;
	}
	#imgPoster{
		 width: 99%;
	}
</style>
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).on("click", "#innerNav a", function() {
			var lnk = $(this).attr("href");
			$("#innerContent").empty();
			$.ajax({
				url: lnk,
				dataType:"html",
				success:function(e){
					$("#subNav").html(e);	
					$("#subNav").animate({opacity: "1.0"},500);	
					}					
				});
			return false;	
		});
		
		$(document).on("click", "#subNav a.subNav", function() {
			var lnk = $(this).attr("href");
			$.ajax({
				url: lnk,
				dataType:"html",
				success:function(e){
					$("#innerContent").html(e);
					}					
				});
			return false;			
		});
	});

</script>

</head>
<body>

	<div id="innerNav">
		<a href="adminFestival.do">행사관리</a>
		<a href="lineupManager.do">라인업 관리</a>
		<a href="readBoardList.do" >게시판 관리</a>		
		<a href="urMng.do">회원관리</a>
		<a href="bizManage.do?fno=4&fCount=3">영업현황</a>		
	</div>
	<div id="subNav">		
	</div>
	<div id="innerContent">
		<img alt="" src="img/office.jpeg" id="imgPoster">
	</div>
	
</body>
</html>