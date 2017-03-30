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
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
#innerContent {
	width: 1000px;
	height: 1600px; /* 1600에서 바꿈 */
	margin: 0 auto;
	padding: 20px;
	font-family: 'Hanna', serif;
	
}
#innerContent #rMainWrap{
	width: 800px;
	height: 550px;
	background-color: #F48FB1;
	border: 5px dashed white;
	padding: 25px;
}
#titleP {
	font-size: 1.7em;
	font-weight: bold;
	color: black;
}
#innerContent label {
	display: inline-block;
	width: 150px;
	border-right: 1px solid black;
}
table {
		border-collapse: collapse;
		margin:0 auto;
		table-layout: fixed !important;
		width:600px !important;
		margin-left: 0 !important;
	}
table th, td{
		border: 1px solid black;
	}
	
th {
		background-color: #FFD9FA;
		padding:5px;
		height:30px;
		table-layout: fixed;
		width: 120px !important;
	}
	
td{
		padding: 5px;
	}
#wrapContent{
		overflow:auto;
		height: 1500px; 
	}
.result{
	font-size: 3em !important;
	font-family: 'Hanna', serif;
	text-align: center;
	line-height: 2em!important;
}
.rWrap{
	padding: 10px;
	background-color: white !important;
	color: black;
	margin-bottom: 5px;
	font-size: 2em;
}
.rWrap select{
	height: 40px;
	font-size: 1.1em;
	border: 0;
	font-family: 'Hanna', serif;
}
.rWrap #howMany{
	height: 40px;
	font-size: 1.1em;
	border: 3px dotted #F48FB1;
	width: 80px;
	text-align: right;
}
.rStep{
	display: none;
	opacity: 0;
}
.rBtn{
	background-color: #F48FB1 !important;
	text-align: right;
}
.rBtn input{
	font-family: 'Hanna', serif;
	
	padding: 10px;
	border-radius: 140px;
	height: 140px;
	width: 140px;
	margin-top: 20px;
	background-color: #F48FB1;
	
	font-weight: bolder;
	transform: skewx(10deg) rotate(340deg);
	border: 0;
	outline: none;
}
.rBtn input#btnBack{
	font-size: 0.8em;
	color: rgba(255,255,255,0.5);
}
.rBtn input#btnBack:HOVER{
	color: #673AB7;
}
.rBtn input#btnOk{
	font-size: 1.4em;
	color: rgba(255,255,255,0.8);
	margin-right: 20px;
}
.rBtn input#btnOk:HOVER {
	background: url("img/stamp.png") no-repeat center;
	background-size: contain;
	color: #673AB7;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
		$('.rStep').eq(0).css("display", "block");
		$('.rStep').eq(0).animate({opacity:1}, 200);
	});	
	$(document).on("change", '#seatSelect', function() {
		var seatSelectVal = Number($("#seatSelect").val());
		for(var i = 0 ; i <seatSno.length; i++){			
			if(seatSelectVal == seatSno[i]){
				seatLast = seatMax[i]-seatSold[i];
				if(seatLast>0){
					$('#money').html('<label>금액</label> '+seatPrice[i]+'원<br>'
							+'<label>남은 티켓 수</label> '+seatLast+'장'
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
		$('.rStep').eq(1).css("display", "block");
		$('.rStep').eq(1).animate({opacity:1}, 300, false, function() {
			$('.rStep').eq(2).animate({opacity:1}, 200);
			$('.rStep').eq(2).css("display", "block");
		});
		
		
	});
	$(document).on('click', '#howMany', function() {
		var num = 1;		
		$('#howMany').change(function() {
			$('#howMany').attr("max", seatLast);
			num = Number($('#howMany').val());
			$('#btnOk').removeAttr('disabled');			
			if(num>seatLast){
				alert("구매 가능 수량을 넘었어요.");
			}	 
		});
		if(num > seatLast ){
			alert("티켓이 이미 매진입니다.");
			$('#btnOk').attr('disabled','disabled');
		}else{			
			$('#howMany').attr("max", seatLast);
			$('#btnOk').removeAttr('disabled');
			$('.rStep').eq(3).animate({opacity:1}, 200);
			$('.rStep').eq(3).css("display", "block");
		}
		
	});
	$(document).one("change", "#pay", function() {
		$('.rStep').eq(4).animate({opacity:1}, 200);
		$('.rStep').eq(4).css("display", "block");
	});
	$(document).on('click', '#btnOk', function() {		
		var ok =  confirm(uname+" 고객님, "+ resultGrade+"열 티켓 "+resultPrice+"원의 결재를 완료 하시겠습니까?");
		if(ok){
			return true;			
		}else{			
			return false;
		} 
	});
	$(document).on('click', '#btnBack', function() {
		$(".rStep").css("display", "none");
		$(".rStep").css("opacity", 0);
	});		
	$(document).ready(function() {
		$(document).on("click", "#innerNav a#rdo", function() {//
			$("#innerContent").empty();	
			var lnk = $(this).attr("href");			
			$.ajax({
				url: lnk,
				dataType:"html",
				success:function(data){
					var resHtml =$(data).find("#wrapContent").html();
					$("#innerContent").delay(50);	
					$("#innerContent").html(resHtml);
					}					
				});
			return false;	
		});
		$(document).on("click", "#innerNav a#rcfdo", function() {
			$("#innerContent").empty();
			var lnk = $(this).attr("href");			
			$.ajax({
				url: lnk,
				dataType:"html",
				success:function(e){
					$("#innerContent").html(e);						
					}					
				});
			return false;	
		});
		$(document).on("click", "#innerContent a#cancel", function() {
			$("#innerContent").empty();
			var lnk = $(this).attr("href");			
			$.ajax({
				url: lnk,
				dataType:"html",
				success:function(e){
					$("#innerContent").html(e);						
					}					
				});
			return false;	
		});
		
		$(document).on("submit", "#innerContent form", function() {
			$("#innerContent").empty();	
			var lnk = $(this).attr("action");
			var res = $(this).serialize();
			$.ajax({
				url: lnk,
				type:"post",
				data:res,
				dataType:"html",
				success:function(e){
					$("#innerContent").delay(100);
					$("#innerContent").html(e);	
					}					
				});
			return false;		
			
		}); 
		$(document).on("click", ".result a", function() {
			$("#innerContent").empty();
			var lnk = $(this).attr("href");			
			$.ajax({
				url: lnk,
				dataType:"html",
				success:function(e){
					$("#innerContent").html(e);						
					}					
				});
			return false;	
		});
	});
</script>
</head>
<body>
	<div id="innerNav">
		<a href="reservation.do?fesno=4&id=${auth.id}" id="rdo">예매</a>		
		<a href="reservationConfirm.do?uno=${user.uno }" id="rcfdo">예매 확인</a>
	</div>
	
	<div id="innerContent">
		<div id="wrapContent">
		<div id="rMainWrap">
		<form action="reservation.do" method="post">
		
			<input type="hidden" name="uno" value="${user.uno }">
			<p id="titleP">
				RESERVATION
			</p>
			<br>
			<div class="rDateWrap rwrap">
				<label>일자</label>
				<select name="fesSelect" id="fesSelect">
							<c:forEach var="daysItem" items="${daysInfo }">
								<option value="${daysItem.dno }">${daysItem.dayString } 
								${daysItem.stime } ~ ${daysItem.etime }</option>
							</c:forEach>
						</select>
			</div>
			<div class="rSeatWrap rwrap rStep">
				<label>등급</label>
				<select name="seatSelect" id="seatSelect">
							<option>일정을 먼저 선택해 주세요.</option>
				</select>
				
			</div>
			<div id="money" class="rwrap rStep">원하는 티켓 등급을 선택해 주세요.</div>
			<div class="rTicket rwrap rStep">
				<label>매수</label>
				<input type="number" name="howMany" id="howMany" min="1" disabled="disabled" value="1">장
			</div>
			<div class="pay rwrap rStep">
				<label>결제 수단</label>
				<select name="pay" id="pay">
							<option value="card">신용카드</option>
							<option value="bank">계좌이체</option>
							<option value="cacaoPay">카카오페이</option>
						</select>
			</div>
			<div class="rBtn rwrap rStep">
				<input type="reset" value="취소" id="btnBack"> <input type="submit" value="결제 " id="btnOk" disabled="disabled"> 
			</div>
		</form>
		</div>
		</div>
	</div>
</body>
</html>