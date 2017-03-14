<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${!empty auth}">
		<p>${auth.uname}님. 반갑습니다.</p>
		<a href="logout.do">로그아웃</a>
		<a href="list.do">회원리스트 보기</a>
		<a href="changePwd.do">비밀번호 변경</a>
		<br>
		<a href="reservation.do?fesno=2">예약</a> <!-- 임시로 fesno 지정 -->
	</c:if>
	<c:if test="${empty auth}">
		<a href="login.do">로그인</a>
		<a href="list.do">회원리스트 보기</a>
		<a href="join.do">회원가입</a>
	</c:if>
</body>
</html>