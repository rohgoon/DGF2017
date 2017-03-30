<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.selectFes{
		font-size: 2em;
	}
	.selectFes #selectFno{
		font-size: 1.1em;
		width: 50px;
		font-family: 'Hanna', serif;
	}
	#list .fesWrap{
		font-size: 2em;
	}
	table {
		border: 1px solid #000000;
		border-collapse: collapse;
		
	}
	
	td,th{
		border: 1px solid #000000;
		vertical-align: middle !important;
	}
	#list{
		display: none;
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
	$("#selectFno").on("change focusout", function() {
		var fnoAndSfNum = $(this).val();
		var fsArr = fnoAndSfNum.split(",");
		$.ajax({
			url:"afInfo.do?fno="+fsArr[0]+"&fCount="+fsArr[1]+"",
			dataType:"html",
			success:function(e){
				$("#list").css("display", "block");
				$("#list").html($(e).find("#list").html());
				}
			});
	});
});	
</script>
</head>
<body>
	<div id="wrapContent">
		<div class="selectFes">
				<label>회차 선택</label>
				<select name="fno" id="selectFno">									
					<c:set var="sfnum" value="${startFCount }"></c:set>
					<c:forEach var="item" items="${fesNowList }">
						<option value="${item.fno },${sfnum}">${sfnum}</option>
						<c:set var="sfnum" value="${sfnum+1}"></c:set>
					</c:forEach>
				</select>
				<hr>
			</div>
		<div id="list">		
					<div class="fesWrap">
						페스티벌 회차 : ${fCount }회<br>
						시작일: ${fesInfo.sdayString}<br>
						마감일: ${fesInfo.edayString}<br>
						장소 : ${fesInfo.place }<br>
						<hr>						
					</div>
					<div class="daysWrap">
						<table border="1">
							<tr>
								<th>세부 일자</th>
								<th>시작 시간</th>
								<th>마감 시간</th>
								<th>티켓 등급</th>
								<th>티켓 가격</th>
								<th>티켓 발행수</th>
							</tr>
							
							<c:forEach var="item" items="${fesDetailList }">
								<tr>
									<c:if test="${item.lineChecker == true }">
										<td rowspan="3">${item.dayString }</td>
										<td rowspan="3">${item.stime }</td>
										<td rowspan="3">${item.etime }</td>
									</c:if>
										<td>${item.grade }</td>
										<td>${item.price }원</td>
										<td>${item.maxSeat }</td>
																									
								</tr>
								
							</c:forEach>
							
						</table>
					</div>								
		</div>
	</div>
</body>
</html>