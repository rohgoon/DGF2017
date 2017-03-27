<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	var password = "#{user.upassword}";

	$(document).ready(function() {
		$("#password").focusout(function() {
			if($(this).val() != password){
				alert("비밀번호가 다릅니다.");
				$(this).val() = "";
				$("#btnEdit").attr("disabled", disabled);	
			}else{
				$("#btnEdit").removeAttr("disabled");

			}
			
		});
	});

</script>
</head>
<body>
	<form action="userDel.do?uno=${user.uno }" method="post">
		<p>${user.uname }님의 회원탈퇴 진행</p>
		<label for="password">비밀번호 입력</label><input type="password" id="password" name="password">
		<input type="submit" value="탈퇴" disabled="disabled">
	</form>
</body>
</html>