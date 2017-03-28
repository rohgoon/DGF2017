<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
=======
>>>>>>> refs/remotes/origin/jch4
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
<<<<<<< HEAD
	#innerNav{
		width: 350px;
		height: 100%;	
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
=======
	
>>>>>>> refs/remotes/origin/jch4
	#subNav{
		/* border: blue solid 1px; */
		height: auto;
		opacity: 0;
		width: 1800px;
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
		margin-left: 370px;
		width: 1350px;
		font-family: 'Hanna', serif;
	}
	#imgPoster{
		 width: 90%;
	}
	.subNavInner{
		margin-left: 385px;
	}
	#contentWrapper table {
		border-collapse: collapse;
		margin:0 auto;
		width: 100%;
		font-size: 20px;
		text-align: center;
	}
	
	#contentWrapper th {
		background-color: #FFD9FA;
		padding:5px;
		height:30px;
	}
	
	#contentWrapper td{
		padding: 5px;
	}
	#wrapContent{
		margin-left: 25px;
		overflow:auto;
		height: 1500px; 
	}

</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(document).on("click", "#innerNav a", function() {
			$("#innerContent").empty();
			$("#subNav").css("opacity", 0);	
			var lnk = $(this).attr("href");			
			$.ajax({
				url: lnk,
				dataType:"html",
				success:function(e){
					$("#subNav").html(e);
					$("#subNav").delay(50);						
					$("#subNav").animate({opacity: "1.0"},400);	
					}					
				});
			return false;	
		});
		
		$(document).on("click", "#subNav a.subNav", function() {
			var lnk = $(this).attr("href");
			$(".subNavInner").empty();
			$.ajax({
				url: lnk,
				dataType:"html",
				success:function(e){
					$("#innerContent").delay(50);
					$("#innerContent").html(e);
					}					
				});
			return false;			
		});
		$(document).on("click", ".subNavInner a", function() {
			var lnk = $(this).attr("href");
			$(".subNavInner").empty();
			$.ajax({
				url: lnk,
				dataType:"html",
				success:function(e){
					$("#innerContent").delay(50);
					$("#innerContent").html(e);
					}					
				});
			return false;			
		});

		$(document).on("click", "#innerContent a", function() {
			$("#innerContent").empty();	
			var lnk = $(this).attr("href");	
					
			$.ajax({
				url: lnk,
				dataType:"html",
				success:function(e){
					$("#innerContent").delay(50);
					$("#innerContent").html(e);		
					}					
				});
			return false;	
		});

		$(document).on("submit", "#innerContent form", function() {
			$("#innerContent").empty();	
			var lnk = $(this).attr("action");
			var res = $(this).serialize();
			$.ajax({
				url: lnk,
				type:"post",
				data:res,
				dataType:"html",
				success:function(e){
					$("#innerContent").delay(100);
					$("#innerContent").html(e);	
					}					
				});
			return false;		
			
		}); 
		
	});

	
</script>
</head>
<body>
	<div id="contentWrapper">
		<div id="innerNav">
			<a href="adminFestival.do">행사관리</a>
			<a href="lineupManager.do">라인업 관리</a>
			<a href="readBoardList.do" >게시판 관리</a>		
			<a href="urMng.do">회원관리</a>
			<a href="biz.do">영업현황</a>		
		</div>
		<div id="subNav">		
		</div>
		<div id="innerContent">
			<img alt="" src="img/poster_V1.png" id="imgPoster">
		</div>
	</div>
	
</body>
