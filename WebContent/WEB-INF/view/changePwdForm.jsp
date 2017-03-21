<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/common.js"></script>
<script>
	$(function() {
		$("form[name='f1']").submit(function() {
		
			if (!checkInputEmpty($("input[name]"))) {
					return false;
			}
		});
	});
</script>
</head>
<body>
	<form action="changePwd.do" method="post" name="f1">
		<p>
			<label for="password">현재 암호 :</label> <input type="password"
				name="password"> <span class="error">현재 비밀번호를 입력하세요.</span>
		</p>
		<p>
			<label for="confirmPassword">새 암호 :</label> <input type="password"
				name="confirmPassword">  <span class="error">새 비밀번호를 입력하세요.</span>
		</p>
		<p>
			<input type="submit" value="암호 변경">
		</p>
	</form>
</body>
</html>