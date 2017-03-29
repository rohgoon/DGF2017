<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<style type="text/css">
	/* table {
		border-collapse: collapse;
	}
	
	th{
		background-color: #FFD9FA;
	} */
/*------------------------------------- NEW -------------------------------------*/

	#intro{
		width: 100%;
		height: 300px;
		background-color: #000000;
		text-align: center;
	}
	
	#intro a{
		color: #F48FB1;
		font-size: 50px;
	}
</style>
</head>
<body>
		<%-- <p>content 영역</p>
		<h1>DGF 페스티벌 정보</h1>
		<a href="register.do">새 페스티벌 등록</a>
		
		<table border="1">
			<tr>
				<th>회차</th>
				<th>장소</th>
				<th>시작일</th>
				<th>종료일</th>
			</tr>
			
		<c:forEach var="item" items="${viewList }">
			<tr>
				<td><a href="festivalSelected.do?fno=${item.fno }">${item.fno }</a></td>
				<td>${item.place }</td>
				<td>${item.sdayString }</td>
				<td>${item.edayString }</td>
			</tr>
		</c:forEach>	
			
		</table> --%>
		
<!-------------------------------- [new] -------------------------------->	

<div id="intro">
	<a>dgf 2017 INFORMATION</a>
</div>
<c:forEach var="item" items="${viewList }">
	<a>${item.place }</a>
</c:forEach>
</body>
</html>