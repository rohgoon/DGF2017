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

	});
</script>
</head>
<body>
	<form action="afNew.do?no=3" method="post" id="afnForm2">
		<c:forEach var="item" items="${fesDate }">
		일차 : ${item }<br>
		시작시간 : <input type="time" name="stime" class="stime">
		마감시간 : <input type="time" name="etime" class="etime">
		</c:forEach>
		<input type="submit" value="다음">
	</form>
</body>
</html>