<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	var seatDno = '<c:out value="${seatDno}"/>';
	var seatSno = '<c:out value="${seatSno}"/>';
	var seatGrade = '<c:out value="${seatGrade}"/>';
	var seatPrice = '<c:out value="${seatPrice}"/>';
	var seatMax = '<c:out value="${seatMax}"/>';
	var seatSold = '<c:out value="${seatSold}"/>';
	$(document).on("change", '#fesSelect', function() {
		var fesSelectVal = Number($("#fesSelect").val());
		alert(seatDno[1]);
		for(int i = 0 ; i <seatDno.length; i++){
			if(fesSelectVal == seatDno[i]){
				$('#seatSelect').append('<option value="'+seatSno[i]+'">'+seatGrade[i]+'</option>');
			}
		}
	});
	/* function fesSelectChange(){
		var fesSelectVal = Number($("#fesSelect").val());
		alert(seatDno[1]);
		for(int i = 0 ; i <seatDno.length; i++){
			if(fesSelectVal == seatDno[i]){
				$('#seatSelect').append('<option value="'+seatSno[i]+'">'+seatGrade[i]+'</option>');
			}
		}
		

	} */
	function seatSelectChange(){
		var seatSelectVal = Number($("#seatSelect").val());

		for(int i = 0 ; i <seatSno.length; i++){
			if(seatSelectVal == seatSno[i]){
				$('#seatSelect').after('<br>결제 금액 : '+seatPrice[i]+'원<br>'
						+'남은 티켓 수 : '+(seatMax[i]-seatSold[i])+'/'+seatMax[i]+'장 <input type="hidden" name="seatResult" value="'+seatSold[i]+'">');
			}
		}
		

	}

</script>
</head>
<body>
	<form action="reservation.do?fno=${param.fesno }" method="post">
		제 ${param.fesno }회 대구 걸그룹 페스티벌 예매<br> 일정 선택 : 
		<select name="fesSelect" id="fesSelect" >
			<c:forEach var="daysItem" items="${daysInfo }">
				<option value="${daysItem.dno }">${daysItem.day }=>
					${daysItem.stime } ~ ${daysItem.etime }</option>
			</c:forEach>
		</select> <br> 티켓 등급 : <select name="seatSelect" id="seatSelect"
			onselect="seatSelectChange()">
			<%-- <c:forEach var="seatItem" items="${seatInfo }">
				<c:if test="${param.fesSelect == seaItem.dno }">
					<option value="${seatItem.sno }">${seatItem.grade }</option>
				</c:if>				
			</c:forEach> --%>
		</select>
		<%-- 가격 : 
		<c:forEach var="price" items="${seatInfo }">
			<c:if test="${price.sno == param.sno }">
				${price.price }원
				<br>
				남은 좌석 수 : ${price.max - price.sold }/${price.max }
				<input type="hidden" name="seatResult" value="${price.sno }">  
			</c:if>			
		</c:forEach> --%>
		<br> 결제 수단 선택 : <select name="pay">
			<option value="card">신용카드</option>
			<option value="bank">계좌이체</option>
			<option value="cacaoPay">카카오페이</option>
		</select><br> <input type="submit" value="결제 완료"><input
			type="reset" value="취소">
	</form>
</body>
</html>