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
	$(document).on("click", "#cancel", function() {
		var ok = confirm("정말로 취소 하시겠습니까?");
		if(ok){
			return true;
		}else{
			return false;
		}
	});
</script>
</head>
<body>
	<!-- div로 -->
	<div>
		<p>${userInfo.uname } 고객님의 예매 내역입니다.</p>
		<hr>
		<div id="list">
			<c:forEach var="item" items="${reservationList }">
				<c:if test="${item.uno == userInfo.uno }">
					페스티벌 회차 : ${item.fno }회<br> 
					공연일 : ${item.dayString }<br>
					티켓 등급 : ${item.grade }<br>
					가격 : ${item.price }<br>
					결제 시간: ${item.rtime }<br>
					<a href="reservationCancel.do?rno=${item.rno }" id="cancel">예매 취소</a>
					<hr>
				</c:if>
			</c:forEach>			
		</div>
	</div>
</body>
</html>