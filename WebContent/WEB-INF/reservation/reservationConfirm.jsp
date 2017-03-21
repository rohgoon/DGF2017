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
			$(".divItems").eq(displayIndex[i]).append("구매수 : "+sumDivsNum[i]+"매<hr>");		
		};
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
						<div class="divItems">
						페스티벌 회차 : ${item.fno }회<br> 
						공연일 : ${item.dayString }<br>
						티켓 등급 : ${item.grade }<br>
						가격 : ${item.price }<br>
						결제 시간: ${item.rtimeString }<br>
						<input type="hidden" class="checkRtime" value="${item.rtimeString }">
						<a href="reservationCancel.do?uno=${item.uno }&rtime=${item.rtimeString}" id="cancel">예매 취소</a>
						<br>
					</div>
				</c:if>
			</c:forEach>			
		</div>
	</div>
</body>
</html>