<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<table border="1">
		<tr>
			<th>일정 번호</th>
			<td>${selectedDays.dno }</td>
		</tr>
		
		<tr>
			<th>회차</th>
			<td>${selectedDays.fno }</td>
		</tr>
		
		<tr>
			<th>날짜</th>
			<td>${selectedDays.day }</td>
		</tr>
		
		<tr>
			<th>시작 시간</th>
			<td>${selectedDays.stime }</td>
		</tr>
		
		<tr>
			<th>마감 시간</th>
			<td>${selectedDays.etime }</td>
		</tr>
	</table>
	
	<a href="daysList.do">돌아가기</a>
	<a href="daysUpdate.do?dno=${selectedDays.dno }">수정</a>
	<a href="daysDelete.do?dno=${selectedDays.dno }">삭제</a>

</body>
</html>