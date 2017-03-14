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
	<form action="reservation.do" method="post">
		<%-- 제 ${fesInfo.fno }회  --%>대구 걸그룹 페스티벌 예매<br>
		일정 선택 :
		<select name="fesSelect">
			<c:forEach var="daysItem" items="${daysInfo }">
				<option value="${daysItem.dno }">${daysItem.day } => ${daysItem.stime } ~ ${daysItem.etime }</option>
			</c:forEach>
		</select>
		<br>
		좌석 등급 :
		<select name="seatSelect">
			<c:forEach var="seatItem" items="${seatInfo }">
				<c:if test="${param.fesSelect == seaItem.dno }">
					<option value="${seatItem.sno }">${seatItem.class }</option>
				</c:if>				
			</c:forEach>
		</select>
		가격 : 
		<c:forEach var="price" items="${seatInfo }">
			<c:if test="${price.sno == param.sno }">
				${price.price }원
				<br>
				남은 좌석 수 : ${price.max - price.sold }/${price.max }
				<input type="hidden" name="seatResult" value="${price.sno }">  
			</c:if>			
		</c:forEach>
		<br>
		결제 수단 선택 :
		<select name="pay">
			<option value="card">신용카드</option>
			<option value="bank">계좌이체</option>
			<option value="cacaoPay">카카오페이</option>
		</select>
		<input type="submit" value="결제 완료"><input type="reset" value="취소">
	</form>
</body>
</html>