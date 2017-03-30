<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#inTitle{
		font-size: 2em;
	}
	#inTitle input#place{
		font-size: 1.1em;
		width: 800px;
		font-family: 'Hanna', serif;
	}
	#inTitle input.fesEditBtns{
		font-family: 'Hanna', serif;
		padding: 10px;
		font-size: 0.9em;
		margin-top: 10px;
	}
	.selectFes{
		font-size: 2em;
	}
	.selectFes #selectFno{
		font-size: 1.1em;
		width: 50px;
		font-family: 'Hanna', serif;
	}
	.selectFes #afDelBtn{
		font-family: 'Hanna', serif;
		padding: 10px;
		font-size: 0.9em;
		margin-top: 10px;
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
		$(document).on("click", "#afDelBtn", function() {
			var fnoAndSfNum = $("#selectFno").val();
			var fsArr = fnoAndSfNum.split(",");
			$.ajax({
				url:"afDel.do?fno="+fsArr[0]+"",
				dataType:"html",
				success:function(e){					
					$("#wrapContent").html($(e).find("#wrapContent").html());
					}
				});
			return false;
		});
		$("#selectFno").on("change focusout click", function() {
			var fnoAndSfNum = $(this).val();
			var fsArr = fnoAndSfNum.split(",");
			$.ajax({
				url:"afEdit.do?fno="+fsArr[0]+"&fCount="+fsArr[1]+"",
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
				<input type="button" value="행사 삭제" id="afDelBtn" class="fesEditBtns">
				<hr>
			</div>
		<div id="list">
			<div id="inTitle">
				<form action="afEdit.do?fno=${fesInfo.fno }" method="post">				
					<h1 id="h1Title">페스티벌 회차 : <span id="fCountSelected">${fCountSelected }</span>회</h1>
					<label for="place">장소 : </label>
					<input type="text" name="place" value="${fesInfo.place }" id="place">
					<br><input type="submit" value="행사 수정" class="fesEditBtns">   	
			</form>
			</div>
			<hr>
			<div class="daysWrap">
						<table border="1">
							<tr>
								<th>세부 일자</th>
								<th>시작 시간</th>
								<th>마감 시간</th>
								<th>티켓 등급</th>
								<th>티켓 가격</th>
								<th>티켓 발행수</th>
								<th>해당 티켓 정보 수정</th>
								<th>해당 일자 정보 수정</th>
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
										<td>
											<a href="seatEdit.do?sno=${item.no}">수정</a><br>
											<a href="seatDel.do?sno=${item.no}">삭제</a>
										</td>
									<c:if test="${item.lineChecker == true }">
										<td rowspan="3">
											<a href="daysEdit.do?dno=${item.dno}">수정</a><br>
											<a href="daysDel.do?dno=${item.dno}">삭제</a>
										</td>
									</c:if>																	
								</tr>								
							</c:forEach>
							
						</table>
					</div>					
				
		</div>
	</div>	
</body>
</html>