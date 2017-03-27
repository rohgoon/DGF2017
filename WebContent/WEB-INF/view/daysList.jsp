<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<h1>DGF 세부일정</h1>
	<a href="#">새 일정 등록</a>
	<table border="1">
		<tr>
			<th>일정 번호</th>
			<th>회차</th>
			<th>날짜</th>
			<th>시작 시간</th>
			<th>마감 시간</th>
		</tr>
		
	<c:forEach var="item" items="${viewList }">
		<tr>
			<td><a href="daysSelected.do?dno=${item.dno }">${item.dno }</a></td>
			<td>${item.fno }</td>
			<td>${item.day }</td>
			<td>${item.stime }</td>
			<td>${item.etime }</td>
		</tr>
	</c:forEach>	
		
	</table>

</body>
</html>