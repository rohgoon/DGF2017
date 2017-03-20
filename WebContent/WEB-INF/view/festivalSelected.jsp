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
	<h1>${selectedFestival.fno }회 DGF 페스티벌 정보</h1>
	<table border="1">
		<tr>
			<th>페스티벌 회차</th>
			<td>${selectedFestival.fno }</td>
		</tr>
		
		<tr>
			<th>페스티벌 장소</th>
			<td>${selectedFestival.place }</td>
		</tr>
		
		<tr>
			<th>페스티벌 시작일</th>
			<td>${selectedFestival.sday }</td>
		</tr>
		
		<tr>
			<th>페스티벌 종료일</th>
			<td>${selectedFestival.eday }</td>
		</tr>
	</table>
	
	<a href="festivalList.do">돌아가기</a>
	<a href="festivalUpdate.do?fno=${selectedFestival.fno }">수정</a>
	<a href="festivalDelete.do?fno=${selectedFestival.fno }">삭제</a>

</body>
</html>