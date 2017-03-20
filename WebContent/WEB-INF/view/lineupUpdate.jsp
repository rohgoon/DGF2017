<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="lineupUpdate.do?lno=${updateLineup.lno }" method="post">
		<fieldset>
			<legend>라인업 수정</legend>
			출연진 번호 : <input type="text" name="lno" value="${updateLineup.lno }" readonly="readonly"><br>
			일정 번호 : <input type="text" name="dno" value="${updateLineup.dno }"><br>
			아티스트 명 : <input type="text" name="aname" value="${updateLineup.aname }"><br>
			<input type="reset" value="취소">
			<input type="submit" value="등록">
		</fieldset>
	</form>

</body>
</html>