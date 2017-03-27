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
	var password = "${user.upassword}";

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
	<form action="userEdit.do?uno=${user.uno }" method="post" id="fEdit">
		<label for="id">아이디 : </label><input type="text" id="id" name="id" value="${user.id }" disabled="disabled"><br>
		<label for="name">이름 : </label><input type="text" id="name" name="name" value="${user.uname }" disabled="disabled"><br>
		<label for="password">비밀번호 확인 : </label><input type="password" id="password" name="password"><br>
		<label for="repassword">비밀번호 변경: </label><input type="password" id="repassword" name="repassword"><br>
		<label for="email">이메일 : </label><input type="text" id="email" name="email" value="${user.email }"><br>
		<label for="phone1">전화번호 : </label><input type="text" id="phone1" name="phone1" value="${phone[0] }">-<input type="text" id="phone2" name="phone2" value="${phone[1] }">-<input type="text" id="phone3" name="phone3" value="${phone[2] }"><br>
		<input type="submit" value="수정" disabled="disabled" id="btnEdit">
		<input type="reset" value="취소">
	</form>
	<a href="userDel.do?uno=${user.uno }">탈퇴</a>
</body>
</html>