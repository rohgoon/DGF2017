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
	<a href="afNew.do?fno=${fno }&fCount=${fCount}" class="subNav">새로운 행사 입력</a>
	<a href="afEdit.do?fno=${fno }&fCount=${fCount}" class="subNav">행사 정보 수정</a>
	<a href="afInfo.do?fno=${fno }&fCount=${fCount}" class="subNav">행사 정보 확인</a>
</body>
</html>