<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="register.do" method="post">
		<fieldset>
			<legend>페스티벌 등록</legend>
			페스티벌 회차 : <input type="text" name="fno"><br>
			페스티벌 장소 : <input type="text" name="place"><br>
			페스티벌 시작일 : <input type="date" name="sday"><br>
			페스티벌 종료일 : <input type="date" name="eday"><br>
			<input type="reset" value="취소">
			<input type="submit" value="등록">
		</fieldset>
	</form>

</body>
</html>