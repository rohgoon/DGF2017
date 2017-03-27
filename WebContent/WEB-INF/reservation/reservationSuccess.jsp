<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/reset.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/front.css?ver=1">
<style type="text/css">
@font-face{ 
	font-family: 'Arca Majora 3 Heavy';
	 src:url(font/ArcaMajora3-Heavy.otf); 
	} 
	body{
		font-family: 'Arca Majora 3 Heavy', '12롯데마트행복Medium';
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
</script>
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
		<div id="innerNav">
			<a href="reservation.do?fesno=${param.fesno }&id=${auth.id}">예매</a> <!-- 임시로 fesno 지정 -->
			<a href="reservationConfirm.do?uno=${user.uno }">예매 확인</a>
		</div>
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
	</div>
</div>

</body>
</html>