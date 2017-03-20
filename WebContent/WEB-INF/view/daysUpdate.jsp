<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="daysUpdate.do?dno=${updateDays.dno }" method="post">
		<fieldset>
			<legend>세부 일정 수정</legend>
			일정번호 : <input type="text" name="dno" value="${updateDays.dno }" readonly="readonly"><br>
			회차 : <input type="text" name="fno" value="${updateDays.fno }"><br>
			날짜 : <input type="date" name="day" value="${updateDays.day }"><br>
			시작 시간 : <input type="datetime" name="stime" value="${updateDays.stime }"><br>
			마감 시간 : <input type="datetime" name="etime" value="${updateDays.etime }"><br>
			<input type="reset" value="취소">
			<input type="submit" value="등록">
		</fieldset>
	</form>

</body>
</html>