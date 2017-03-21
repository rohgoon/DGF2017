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
	.lineup{
		width: 100%;
		height: 100px;
		border: 1px solid #000000;
	}
</style>
</head>
<body>
<div id="container">
	<div id="header">
		<div id="nav">
			<jsp:include page="../../template/nav.jsp"></jsp:include>
		</div>
		
		<div id="login">
			<jsp:include page="../../template/login.jsp"></jsp:include>
		</div>
	</div>
	

	<div id="title">
		<jsp:include page="../../template/title.jsp"></jsp:include>
	</div>

	<div id="content">
		<c:forEach var="item" items="${viewList }">
			<div class="lineup">
				<p>${item.aname }</p>
			</div>
		</c:forEach>
		
		<%-- <h1>DGF 라인업 정보</h1>
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
				
			</table> --%>
	</div>
	
	<div id="footer">
		<jsp:include page="../../template/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>