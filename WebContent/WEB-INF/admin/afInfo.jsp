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
	<div id="wrapContent">
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