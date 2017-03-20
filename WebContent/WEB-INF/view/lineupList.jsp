<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border-collapse: collapse;
	}
	
	th{
		background-color: #FFB2D9;
	}
</style>
</head>
<body>
	<h1>DGF 라인업 정보</h1>
	<a href="lineupRegister.do">새 라인업 등록</a>
	<table border="1">
		<tr>
			<th>출연진 번호</th>
			<th>일정 번호</th>
			<th>아티스트 명</th>
		</tr>
		
	<c:forEach var="item" items="${viewList }">
		<tr>
			<td><a href="lineupSelected.do?lno=${item.lno }">${item.lno }</a></td>
			<td>${item.dno }</td>
			<td>${item.aname }</td>
		</tr>
	</c:forEach>	
		
	</table>

</body>
</html>