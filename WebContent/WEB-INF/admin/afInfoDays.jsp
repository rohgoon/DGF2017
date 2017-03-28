<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div id="wrapContent">
		<div id="list">
			<form action="daysEdit.do?fno=${days.fno }?dno=${days.dno }" method="post">
				<label>날짜</label>
				<input type="date" name="day" value="${days.dayString }">
				<label>시작시간</label>
				<input type="time" name="stime" value="${days.stime }">
				<label>마감시간</label>
				<input type="time" name="etime" value="${days.etime }">
				<input type="submit" value="수정">
			</form>	
		</div>
	
	<a href="afEdit.do??fno=${fesInfo.fno }&fCount=${fCount}">행사 정보 수정</a>
	</div>
</body>
</html>