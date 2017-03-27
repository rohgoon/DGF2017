<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div>
		<div id="list">						
					<div class="fesWrap">
						페스티벌 회차 : ${fCount }회<br>
						시작일: ${fesInfo.sdayString}<br>
						마감일: ${fesInfo.edayString}<br>
						장소 : ${fesInfo.place }<a href="afEdit.do?fno=${fesInfo.fno }&fCount=${fCount}" id="edit">장소 수정</a><br>
						<a href="afEdit.do?fno=${fesInfo.fno }&fCount=${fCount}" id="edit">수정</a>
						<a href="afDel.do?fno=${fesInfo.fno }&fCount=${fCount}" id="del">삭제</a>
						<hr>						
					</div>
					<div class="daysWrap">
						${fCount }회차 상세 정보
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