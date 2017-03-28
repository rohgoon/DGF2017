<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	
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
		/* border: 1px solid blue; */
		margin-left: 350px;
		width: 1350px;
	}
	#imgPoster{
		 width: 99%;
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).on("click", "#innerNav a", function() {
			$("#subNav").css("opacity", 0);	
			var lnk = $(this).attr("href");
			$("#innerContent").empty();
			$.ajax({
				url: lnk,
				dataType:"html",
				success:function(e){
					$("#subNav").html(e);
					$("#subNav").delay(200);	
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
		<img alt="" src="img/office.jpeg" id="imgPoster">
	</div>
	
</body>
