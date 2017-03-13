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
	
	<c:if test="${viewData.size() == 0 }">
		등록된 회원이 없습니다.
	</c:if>
	<c:if test="${viewData.size() > 0 }">	
	
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>암호</th>
				<th>가입일</th>
			</tr>
			<c:forEach var="member" items="${viewData }">
				<tr>
					<td>${member.id }</td>
					<td>${member.uname }</td>
					<td>${member.upassword }</td>
					<td>${member.regDate }</td>
					
				</tr>
			</c:forEach>
		</table>	
	
	</c:if>
</body>
</html>