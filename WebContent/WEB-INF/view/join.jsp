<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="join.do" method="post">
		<label for="id">아이디 : </label><input type="text" id="id" name="id"><br>
		<label for="password">비밀번호 : </label><input type="password" id="password" name="password"><br>
		<label for="repassword">비밀번호 확인 : </label><input type="password" id="repassword" name="repassword"><br>
		<label for="name">이름 : </label><input type="text" id="name" name="name"><br>
		<label for="email">이메일 : </label><input type="text" id="email" name="email"><br>
		<label for="phone1">전화번호 : </label><input type="text" id="phone1" name="phone1">-<input type="text" id="phone2" name="phone2">-<input type="text" id="phone3" name="phone3"><br>
		<input type="submit" value="가입">
		<input type="reset" value="취소">
	</form>
</body>
</html>