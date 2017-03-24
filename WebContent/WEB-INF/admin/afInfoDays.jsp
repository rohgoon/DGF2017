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
			<c:forEach var="item" items="${fesInfo }">				
					<div class="divItems">
						페스티벌 회차 : ${item.fno }회<br>
						공연일 : ${item.dayString }<br> 
						티켓 등급 : ${item.grade }<br>												
						가격 : ${item.price }<br>
						시작시간: ${item.stime}<br>
						마감시간: ${item.etime}<br>
						티켓 발행매수 : ${item.maxSeat}<br> 
						예매수 : ${item.soldSeat }<br>
						장소 : ${item.place }<br>
						<a href="afEdit.do?sno=${item.sno }" id="edit">수정</a>
						<a href="afDel.do?sno=${item.sno }" id="del">삭제</a>
						<br>
					</div>
				
			</c:forEach>			
		</div>
	</div>
	<a href="#">행사 정보 확인</a>
	<a href="#">행사 정보 수정</a>
</body>
</html>