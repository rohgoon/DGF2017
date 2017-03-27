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
	#titleP{
		font-size: 1.6em;
		font-weight: bold;
	}
	#innerContent label{
		display:inline-block;
		width: 120px;
		border-right: 1px solid black;
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">	
	var seatDno = new Array();
	var seatSno = new Array();	
	var seatGrade =new Array(); 
	var seatPrice =new Array(); 
	var seatMax =new Array(); 
	var seatSold =new Array();
	var seatLast;
	var uname = '${user.uname }';
	var id = '${user.id }';
	var upassword = '${user.upassword }';
	var resultGrade;
	var resultPrice;
	<c:forEach var='item' items='${seatInfo}'>
		seatDno.push(${item.dno});
		seatSno.push(${item.sno});
		seatGrade.push('${item.grade}');
		seatPrice.push(${item.price});
		seatMax.push(${item.max});
		seatSold.push(${item.sold});
	</c:forEach>
	$(document).on("change", '#fesSelect', function() {
		$('#seatSelect').empty();
		var fesSelectVal = Number($("#fesSelect").val());
		for(var i = 0 ; i < seatDno.length; i++){			
			if(fesSelectVal == seatDno[i]){
				$('#seatSelect').append('<option value="'+seatSno[i]+'">'+seatGrade[i]+'</option>');				
			}
		} 
	});	
	$(document).on("change", '#seatSelect', function() {
		var seatSelectVal = Number($("#seatSelect").val());
		for(var i = 0 ; i <seatSno.length; i++){			
			if(seatSelectVal == seatSno[i]){
				seatLast = seatMax[i]-seatSold[i];
				if(seatLast>0){
					$('#money').html('<label>결제 금액</label>'+seatPrice[i]+'원<br>'
							+'<label>남은 티켓 수</label>'+seatLast+'장'
							+'<input type="hidden" name="seatSoldOut" value="'+seatSold[i]+'">'
							+'<input type="hidden" name="seatNoResult" value="'+seatSno[i]+'">'
							);
					resultPrice = seatPrice[i];
					resultGrade = seatGrade[i];
					$('#howMany').removeAttr('disabled');
					
				}else{
					alert("티켓("+seatGrade[i]+")이 매진 되었습니다.");
					$('#btnOk').attr('disabled','disabled');// input number로 기능 이동 할것
					$('#howMany').attr('disabled','disabled');// input number로 기능 이동 할것
				} 
			}
		}
	});
	$(document).on('click', '#howMany', function() {
		var num = 1;		
		$('#howMany').change(function() {
			$('#howMany').attr("max", seatLast);
			num = Number($('#howMany').val());
			$('#btnOk').removeAttr('disabled');			
				 
		});
		if(num > seatLast ){
			alert("티켓이 이미 매진입니다.");
			$('#btnOk').attr('disabled','disabled');
		}else{			
			$('#howMany').attr("max", seatLast);
			$('#btnOk').removeAttr('disabled');
		}
	});
	$(document).on('click', '#btnOk', function() {		
		
		var ok =  confirm(uname+" 고객님, "+ resultGrade+"열 티켓 "+resultPrice+"원의 결재를 완료 하시겠습니까?");
		if(ok){
			return true;			
		}else{			
			return false;
		} 
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
		<form action="reservation.do" method="post">
			<input type="hidden" name="uno" value="${user.uno }">
			<p id="titleP">환영합니다 ${user.uname } 고객님<br>
			제 ${param.fesno }회 대구 걸그룹 페스티벌 예매</p>
			<label>일정 선택 </label>
			<select name="fesSelect" id="fesSelect" >
				<c:forEach var="daysItem" items="${daysInfo }">
					<option value="${daysItem.dno }">${daysItem.dayString }=>
						${daysItem.stime } ~ ${daysItem.etime }</option>
				</c:forEach>
			</select> <br>
			<label>티켓 등급 </label>
			<select name="seatSelect" id="seatSelect">
						<option>일정을 먼저 선택해 주세요.</option>
					</select>
			<br>
			<div id="money">원하는 티켓 등급을 선택해 주세요.</div>
			<label>매수</label><input type="number" name="howMany" id="howMany" min="1" disabled="disabled">
			<br> 
			<label>결제 수단 선택</label>
			<select name="pay" id="pay">
				<option value="card">신용카드</option>
				<option value="bank">계좌이체</option>
				<option value="cacaoPay">카카오페이</option>
			</select><br> 
			<input type="submit" value="결제 완료" id="btnOk" disabled="disabled">
			<input type="reset" value="취소" id="btnBack">
		</form>
		</div>
		</div>
	</div>
</body>
</html>