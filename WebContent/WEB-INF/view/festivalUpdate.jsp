<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="festivalUpdate.do?fno=${updateFestival.fno }" method="post">
		<fieldset>
			<legend>페스티벌 수정</legend>
			페스티벌 회차 : <input type="text" name="fno" value="${updateFestival.fno }" readonly="readonly"><br>
			페스티벌 장소 : <input type="text" name="place" value="${updateFestival.place }"><br>
			페스티벌 시작일 : <input type="date" name="sday" value="${updateFestival.sday }"><br>
			페스티벌 종료일 : <input type="date" name="eday" value="${updateFestival.eday }"><br>
			<input type="reset" value="취소">
			<input type="submit" value="등록">
		</fieldset>
	</form>

</body>
</html>