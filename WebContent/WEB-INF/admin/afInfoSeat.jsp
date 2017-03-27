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
	<div>
		<div id="list">
			<form action="seatEdit.do?sno=${seat.sno }" method="post">
				<label for="grade">등급명</label>
				<input type="text" id="grade" name="grade" value="${seat.grade }"><br>
				<label for="price">가격</label>
				<input type="number" name="price" id="price"><br>
				<label for="max">티켓 발행 매수</label>
				<input type="number" name="max" id="max"><br>
				<input type="submit" value="수정">
			</form>
		</div>
	</div>
	<a href="#">행사 정보 확인</a>
	<a href="#">행사 정보 수정</a>
</body>
</html>