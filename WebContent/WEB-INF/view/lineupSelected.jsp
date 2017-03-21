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
</style>
</head>
<body>
	<table border="1">
		<tr>
			<th>출연진 번호</th>
			<td>${selectedLineup.lno }</td>
		</tr>
		
		<tr>
			<th>일정 번호</th>
			<td>${selectedLineup.dno }</td>
		</tr>
		
		<tr>
			<th>아티스트 명</th>
			<td>${selectedLineup.aname }</td>
		</tr>
	</table>
	
	<a href="lineupList.do">돌아가기</a>
	<a href="lineupUpdate.do?lno=${selectedLineup.lno }">수정</a>
	<a href="lineupDelete.do?lno=${selectedLineup.lno }">삭제</a>

</body>
</html>