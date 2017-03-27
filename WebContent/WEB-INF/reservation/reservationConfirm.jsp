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
	#innerContent{
		width: 1000px;
		margin: 0 auto;
		padding: 20px;
	}
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
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	var check =null;
	var num=0;
	var displayIndex= new Array();
	var sumDivs =1;
	var sumDivsNum = new Array();
	var length = 0;
	<c:forEach var='item' items='${reservationList }'>
		length++;	
		if(check == '${item.rtimeString}'){
			sumDivs++;	
		}else{
			if((length-num)==1){
				displayIndex.push(num);
				sumDivs++;
				sumDivsNum.push(sumDivs);
				sumDivs = 1;
			}else{			
				displayIndex.push(num);
				sumDivsNum.push(sumDivs);
				sumDivs = 1;
			}
		}
		check = '${item.rtimeString }';
		num++;
	</c:forEach>
	$(document).on("click", "#cancel", function() {
		var ok = confirm("정말로 취소 하시겠습니까?");
		if(ok){
			return true;
		}else{
			return false;
		}
	});
	$(document).ready(function() {
		$(".divItems").css("display", "none");
		for(var i =0; i < displayIndex.length; i++){
			$(".divItems").eq(displayIndex[i]).css("display", "block");
			$(".divItems").eq(displayIndex[i]).append("<label>구매수</label> "+sumDivsNum[i]+"매<br>");		
		};
	});
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
			<a href="reservation.do?fesno=4&id=${auth.id}">예매</a> <!-- 임시로 fesno 지정 -->
			<a href="reservationConfirm.do?uno=${user.uno }">예매 확인</a>
		</div>
		<div id="innerContent">
		<p id="titleP">${userInfo.uname } 고객님의 예매 내역입니다.</p>
		<hr>
		<div id="list">
				<c:forEach var="item" items="${reservationList }">
					<c:if test="${item.uno == userInfo.uno }">
						<div class="itemList">
							<div class="divItems">
								<label>페스티벌 회차 </label> ${item.fno }회<br> 
								<label>공연일 </label> ${item.dayString }<br>
								<label>티켓 등급 </label> ${item.grade }<br>
								<label>가격 </label> ${item.price }<br>
								<label>결제 시간</label> ${item.rtimeString }<br>
								<input type="hidden" class="checkRtime" value="${item.rtimeString }">								
								
							</div>
							<br>
							<div class="aBtn">
								<a href="reservationCancel.do?uno=${item.uno }&rtime=${item.rtimeString}" id="cancel">[예매취소]</a>
							</div>
							<hr>
						</div>
					</c:if>
				</c:forEach>			
			</div>
		</div>
	</div>
</div>
</body>
</html>