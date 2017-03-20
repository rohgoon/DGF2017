<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="lineupRegister.do" method="post">
		<fieldset>
			<legend>뉴 라인업 등록</legend>
			출연진 번호 : <input type="text" name="lno" readonly="readonly" placeholder="입력ㄴㄴ해"><br>
			일정 번호 : <input type="text" name="dno"><br>
			아티스트 명 : <input type="text" name="aname"><br>
			<input type="reset" value="취소">
			<input type="submit" value="등록">
		</fieldset>
	</form>

</body>
</html>