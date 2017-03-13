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
		<a href="write.do">[게시글 작성하기]</a>
		<a href="listarticle.do">[게시글 목록보기]</a>
	</c:if>
	<c:if test="${empty auth}">
		<a href="login.do">로그인</a>
		<a href="list.do">회원리스트 보기</a>
		<a href="join.do">회원가입</a>
	</c:if>
</body>
</html>