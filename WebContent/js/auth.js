/** <script> * */

// 로그인 기능
// 1. INPUT ID's id = #login_id
// 2. INPUT PW's id = #login_pw
function login() {
	var id = $("#login_id").val();
	var password = $("#login_pw").val();
	$.ajax({
		url : "login.do",
		type : "post",
		data : {
			"id" : id,
			"password" : password
		},
		dateType : "html",
		success : function(result) {
			if (result != "") {
				location.href = "front.jsp";
			} else {
				alert("회원정보가 일치하지 않습니다.");
				return false;
			}

		}
	});
}

function checkID(obj) {
	var id = $(obj).val();
	$.ajax({
		url : "checkId.do",
		type : "get",
		data : {
			"id" : id
		},
		dateType : "html",
		success : function(result) {
			if (result.trim() == id) {
				return;
			} else {
				alert("존재하지 않는 아이디입니다. 아이디를 확인하세요.")
				$(obj).val("");
			}
		}
	});
}


function notLogin(){
	$("#loginDialog").css("visibility", "hidden");
	location.href = "front.jsp";
}

function goJoin(){
	$.ajax({
		url : "join.do",
		type : "get",
		dateType : "html",
		success : function(result) {
			$(".loginBox").html(result);
		}
	});
}

function backToLogin(){
	$.ajax({
		url : "login.do",
		type : "get",
		dateType : "html",
		success : function(result) {
			$("#innerWrap").html(result);
		}
	});
}


function logOut(){
	$.ajax({
		url : "logout.do",
		type : "get",
		dateType : "html",
		success : function(result) {
			location.reload();
		}
	});
}

function join(){
	var id = $("#id").val();
	var name = $("#name").val();
	var password = $("#password").val();
	var email = $("#email").val();
	var phone1 = $("#phone1").val();
	var phone2 = $("#phone2").val();
	var phone3 = $("#phone3").val();
	
	$.ajax({
		url : "join.do",
		type : "post",
		data : {
			"id" : id,
			"name" : name,
			"email" : email,
			"password" : password,
			"phone1" : phone1,
			"phone2" : phone2,
			"phone3" : phone3
		},
		dateType : "html",
		success : function(result) {
			location.reload();
		}
		
	});
}

/** </script> * */
