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

	.divItems label{
		display:inline-block;
		width: 120px;
		border-right: 1px solid black;
	}
	.itemList{
		position: relative;
	}
	.itemList .aBtn{
		position: absolute;
		top: 0;
		right: 10px;
	
	}
	.aBtn a{
		color: blue;
		text-decoration: none;
	}
	.aBtn a:HOVER{
		color: rgba(255,167,167,1);
		text-decoration: none;
	}
	
	#titleP{
		font-size: 1.6em;
		font-weight: bold;
		margin-left: 20px;
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<p id="titleP">${userInfo.uname } 고객님의 예매 내역입니다.</p>
<div id="wrapContent">		
		<hr>
		<div id="list">
				<c:forEach var="item" items="${reservationList }">
					<div class="divItems">
								<label>페스티벌 회차 </label> ${item.fno }회<br> 
								<label>공연일 </label> ${item.dayString }<br>
								<label>티켓 등급 </label> ${item.grade }<br>
								<label>가격 </label> ${item.price }<br>
								<label>결제 시간</label> ${item.rtimeString }<br>
								<label>티켓 수</label> ${item.howMany }매<br>
								<input type="hidden" name="checkRtime" value="${item.rtimeString }">
							</div>
							<br>
							<div class="aBtn">
								<a href="reservationCancel.do?uno=${item.uno }&rno=${item.rno}&sno=${item.sno }" id="cancel">[예매취소]</a>
							</div>
							<hr>
				</c:forEach>			
			</div>
		</div>
</body>
</html>