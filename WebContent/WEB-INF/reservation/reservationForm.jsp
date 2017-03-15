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
	var seatDno = new Array();
	var seatSno = new Array();	
	var seatGrade =new Array(); 
	var seatPrice =new Array(); 
	var seatMax =new Array(); 
	var seatSold =new Array();
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
				$('#money').html('결제 금액 : '+seatPrice[i]+'원<br>'
						+'남은 티켓 수 : '+(seatMax[i]-seatSold[i])+'장 <input type="hidden" name="seatResult" value="'+seatSold[i]+'">');
				resultPrice = seatPrice[i];
				resultGrade = seatGrade[i];
			}
		}
	});
	$(document).on('click', '#btnOk', function() {
		/* var ok =  */confirm(uname+" 고객님, "+ resultGrade+"열 티켓 "+resultPrice+"원의 결재를 완료 하시겠습니까?");
		/* if(ok){
			return true;			
		}else{			
			return false;
		} */
	});
</script>
</head>
<body>
	<form action="reservation.do?fno=${param.fesno }" method="post">
		<input type="hidden" name="uno" value="${user.uno }">
		환영합니다 ${user.uname } 고객님<br>
		제 ${param.fesno }회 대구 걸그룹 페스티벌 예매<br> 일정 선택 : 
		<select name="fesSelect" id="fesSelect" >
			<c:forEach var="daysItem" items="${daysInfo }">
				<option value="${daysItem.dno }">${daysItem.day }=>
					${daysItem.stime } ~ ${daysItem.etime }</option>
			</c:forEach>
		</select> <br>
		티켓 등급 : <select name="seatSelect" id="seatSelect">
					<option>일정을 먼저 선택해 주세요.</option>
				</select>
		<br>
		<div id="money">원하는 티켓 등급을 선택해 주세요.</div>
		<br> 결제 수단 선택 : <select name="pay" id="pay">
			<option value="card">신용카드</option>
			<option value="bank">계좌이체</option>
			<option value="cacaoPay">카카오페이</option>
		</select><br> <input type="submit" value="결제 완료" id="btnOk"><input
			type="reset" value="취소" id="btnBack">
	</form>
</body>
</html>