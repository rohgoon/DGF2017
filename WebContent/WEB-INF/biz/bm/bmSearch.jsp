<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String newDate = sdf.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 2px solid black;
	border-collapse: collapse;
}

table th, td {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#bmSearch").on("submit", function() {
			var searchDate = $(this).serialize();
			$.ajax({
					url: "bmSearch.do",
					type: "post",
					data: searchDate,
					dataType:"jsp",
					success:function(res){
						$(".bmContent").html(res);
						}				
				});
		});			
	});
</script>
</head>
<body>
	<a href="bizManage.do">회차별 매출액</a>
	<a href="bmDate.do?bm=year">연도별 매출액</a>
	<a href="bmDate.do?bm=month">월별 매출액</a>
	<a href="bmDate.do?bm=day">일별 매출액</a>
	<a href="bmDate.do?bm=search">기간별 매출액</a>
	<div id="wrapContent">
	<form action="bmSearch.do" id="bmSearch">
		<input type="date" name="sdate" id="sdate" value="${newDate }" >~<input type="date" name="edate" id="edate" value="${newDate }" >
		<input type="submit" value="검색">
		<hr>
	</form>
		<div class="bmContent">		
		</div>
	</div>

</body>
</html>