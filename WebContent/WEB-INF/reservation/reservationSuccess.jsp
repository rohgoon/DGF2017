<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<c:if test="${ticket == true }"><!--true면 예매 완료, false면 매진으로 예매 불가 -->
		<div class="result">
			티켓(${seatInfo.grade })의 결제가 완료 되었습니다.
		</div>
	</c:if>
	<c:if test="${ticket == false }">
		<div class="result">
			티켓(${seatInfo.grade })이 매진 되어 결제가 취소 되었습니다.
		</div>
	</c:if>
	<br>
	결제 확인란으로 이동 하시겠습니까?
	<br>
	<a href="reservationConfirm.do?uno=${reservationInfo.uno }">결재 확인</a>
</body>
</html>