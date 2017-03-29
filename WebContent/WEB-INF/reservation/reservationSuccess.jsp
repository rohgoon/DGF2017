<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="wrapContent">
<div class="result">	
	<c:if test="${ticket == true }"><!--true면 예매 완료, false면 매진으로 예매 불가 -->
		
			티켓(${seatInfo.grade })의 결제가 완료 되었습니다.
		
	</c:if>
	<c:if test="${ticket == false }">
		
			티켓(${seatInfo.grade })이 매진 되어 결제가 취소 되었습니다.
		
	</c:if>
	<br>
	예매 확인란으로 이동 하시겠습니까?
	<br>
	<a href="reservationConfirm.do?uno=${reservationInfo.uno }">예매 확인</a>
</div>
</div>
	