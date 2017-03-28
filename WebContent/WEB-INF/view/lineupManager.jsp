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
		border: 1px solid #000000;
		border-collapse: collapse;
	}
	
	tr,td,th{
		border: 1px solid #000000;
	}
	
</style>
</head>
<body>
		<a href="registerUpload.do" class="subNav">새 라인업 등록</a>
		<div class="subNavInner">
			<table>
				<tr>
					<th>출연진 번호</th>
					<th>일정 번호</th>
					<th>아티스트<br>이름</th>
					<th>아티스트<br>설명</th>
					<th>대표곡<br>1</th>
					<th>대표곡<br>2</th>
					<th>대표곡<br>3</th>
					<th>라인업<br>이미지</th>
				</tr>
				
			<c:forEach var="item" items="${viewList }">
				<tr>
					<td><a href="lineupSelected.do?lno=${item.lno }">${item.lno }</a></td>
					<td>${item.dno }</td>
					<td>${item.aname }</td>
					<td>${item.contents }</td>
					<td>${item.song1 }</td>
					<td>${item.song2 }</td>
					<td>${item.song3 }</td>
					<td>${item.file }</td>
				</tr>
			</c:forEach>	
				
			</table>
		</div>

</body>
</html>