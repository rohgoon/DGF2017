<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="daysRegister.do" method="post">
		<fieldset>
			<legend>세부 일정 등록</legend>
			일정번호 : <input type="text" name="dno" readonly="readonly" placeholder="입력 ㄴㄴ해"><br>
			회차 : <input type="text" name="fno"><br>
			날짜 : <input type="date" name="day"><br>
			시작 시간 : <input type="datetime" name="stime" placeholder="ex)19:00:00 형식으로 입력"><br>
			마감 시간 : <input type="datetime" name="etime" placeholder="ex)22:00:00 형식으로 입력"><br>
			<input type="reset" value="취소">
			<input type="submit" value="등록">
		</fieldset>
	</form>

</body>
</html>