<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

	<input type="text" id="id" name="id" placeholder="ID"  class="inpJoin" readonly="readonly" value="${user.id}">
	<input type="text" id="name" name="name" placeholder="name"  class="inpJoin" readonly="readonly" value="${user.uname}"><br>
	<input type="password" id="password" name="password" placeholder="현재 비밀번호" class="inpJoin" required="required">
	<input type="password" id="repassword" name="repassword" placeholder="변경할 비밀번호"  class="inpJoin" required="required"><br>
	<input type="text" id="email" name="email" placeholder="E-mail"  class="inpJoin" required="required" value="${user.email}"><br>
	<input type="text" id="phone1" name="phone1" placeholder="010" class="inpPhone inpJoin" value="${phone[0]}">-<input type="text" id="phone2" name="phone2" placeholder="0000"  class="inpPhone inpJoin" value="${phone[1]}">-<input type="text" id="phone3" name="phone3" placeholder="0000"  class="inpPhone inpJoin" required="required" value="${phone[2]}"><br>
	<a style="text-align:right" href="userDel.do?uno=${user.uno }">탈퇴하기</a><br>
	<input type="button" value="Edit" onclick="editMyInfo()" class="inpJoin" id="btnEdit" disabled="disabled">
	<input type="button" value="Back" onclick="notLogin()" class="inpJoin">
	
	
	
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
	
	function editMyInfo(){
		var uno =  ${user.uno}
		var password = $("#password").val();
		var repassword = $("#repassword").val();
		var email = $("#email").val();
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();		
	
		$.ajax({
			url : "userEdit.do",
			type : "post",
			data : {
				"uno" : uno,
				"password" : password,
				"repassword" : repassword,
				"email" : email,
				"phone1" : phone1,
				"phone2" : phone2,
				"phone3": phone3
			},
			dateType : "html",
			success : function(result) {
				alert("정보변경에 성공했습니다. 다시 로그인하세요.")
				logOut();
			}
		});
	}
	</script>