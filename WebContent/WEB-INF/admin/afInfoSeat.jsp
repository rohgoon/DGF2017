<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
	table{
		table-layout: fixed !important;
		width:600px !important;
		margin-left: 0 !important;
		
	}
	table th, td{
		border: 1px solid black;
	}
	
</style>
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div id="wrapContent">
		<div id="list">
			<form action="seatEdit.do?sno=${seat.sno }" method="post">
				<table>
					<tr>
						<th><label for="grade">등급명</label></th>
						<td><input type="text" id="grade" name="grade" value="${seat.grade }"></td>
					</tr>
					<tr>
						<th><label for="price">가격</label></th>
						<td><input type="number" name="price" id="price" value="${seat.price }"></td>
					</tr>
					<tr>
						<th><label for="max">티켓 발행 매수</label></th>
						<td><input type="number" name="max" id="max"  value="${seat.max }"></td>
					</tr>
				</table>
				<br><br>
				<input type="submit" value="수정">
			</form>
		</div>
	</div>
</body>
</html>