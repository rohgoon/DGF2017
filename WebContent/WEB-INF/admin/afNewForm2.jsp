<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	table{
		table-layout: fixed !important;
		width:600px !important;
		margin-left: 0 !important;
		
	}
	table th, td{
		border: 1px solid black;
	}
	
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnBack").click(function() {
			location.href = "afNew.do?no=2";
		});
	});
</script>
</head>
<body>
<%
	int num = 1;
%>
<div id="wrapContent">
	<form action="afNew.do?no=3" method="post" id="afnForm2">
		<table>
		<c:forEach var="item" items="${fesDate }">
			<tr>
				<th><%=num++ %>일차</th>
				<td>시작시간 : <input type="time" name="stime" class="stime"></td>
				<td>마감시간 : <input type="time" name="etime" class="etime"></td>
			</tr>
		</c:forEach>
		</table>
		<input type="reset" value="이전" id="btnBack">
		<input type="submit" value="다음">
		
	</form>
</div>
</body>
</html>