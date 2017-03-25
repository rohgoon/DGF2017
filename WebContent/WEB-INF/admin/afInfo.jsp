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
						장소 : ${fesInfo.place }<br>
						<a href="afEdit.dofno=${fesInfo.fno }" id="edit">수정</a>
						<a href="afDel.do?fno=${fesInfo.fno }" id="del">삭제</a>
						<hr>						
					</div>
					<div class="daysWrap">
						<c:forEach var="item" items="${fesDetailList }">
							
							
						</c:forEach>
					
					</div>								
		</div>
	</div>
	<a href="#">행사 정보 확인</a>
	<a href="#">행사 정보 수정</a>
</body>
</html>