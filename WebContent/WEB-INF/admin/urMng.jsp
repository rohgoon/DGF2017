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
<div class="subNavInner">
  <table border="1">
  	<tr>
  		<th>유저번호</th>
  		<th>성명</th>
  		<th>아이디</th>
  		<th>이메일</th>
  		<th>전화번호</th>
  		<th>가입일</th>
  		<th>예매정보</th>
  		<th>정보수정<th>
  	</tr>
  	<c:forEach var="item" items="${userList }">
  	<tr>
  		<td>${item.uno }</td>
  		<td>${item.uname }</td>
  		<td>${item.id }</td>
  		<td>${item.email }</td>
  		<td>${item.phone }</td>
  		<td>${item.regDateString }</td>
  		<td><a href="reservationConfirm.do?uno=${item.uno }">이동</a></td>
  		<td><a href="userEdit.do?uno=${item.uno }">정보수정</a></td>
  	<tr>
  	</c:forEach>  
  </table>
 </div>
</body>
</html>