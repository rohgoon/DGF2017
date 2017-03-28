<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
	<form action="afNew.do?no=3" method="post" id="afnForm2">
		<c:forEach var="item" items="${fesDate }">
		<%=num++ %>일차,
		시작시간 : <input type="time" name="stime" class="stime">
		마감시간 : <input type="time" name="etime" class="etime"><br>
		</c:forEach>
		<input type="reset" value="이전" id="btnBack">
		<input type="submit" value="다음">
		
	</form>
</body>
</html>