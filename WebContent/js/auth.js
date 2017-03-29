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



function backToLogin(){
	$.ajax({
		url : "login.do",
		type : "get",
		dateType : "html",
		success : function(result) {
			$("#loginDialog").css({opacity: "0"});
			$("#loginDialog").html(result);
			$("#loginDialog").delay(500);
			$("#loginDialog").animate({opacity: "1.0"},500);
		}
	});
}


function logOut(){
	$.ajax({
		url : "logout.do",
		type : "get",
		dateType : "html",
		success : function(result) {
			alert("로그아웃 되었습니다.");
			location.reload();
		}
	});
}

function join(){
	var id = $("#id").val();
	var name = $("#name").val();
	var password = $("#password").val();
	var repassword = $("#repassword").val();
	var email = $("#email").val();
	var phone1 = $("#phone1").val();
	var phone2 = $("#phone2").val();
	var phone3 = $("#phone3").val();
	if(password == repassword){
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
				$("#loginDialog").html(result);
				$("#loginDialog").delay(500);
				$("#loginDialog").animate({opacity: "1.0"},500);
			}
		}); // ajax
	}else{
		alert("비밀번호가 일치하지 않습니다.");
		$("#password").val("");
		$("#repassword").val("");
	}
	
}

function checkJoinId(obj){
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
				alert("이미 존재하는 아이디거나 잘못 입력하셨습니다.")
				$(obj).val("");
			} else {
				alert("사용해도 좋은 아이디 입니다.")
				return;
			}
		}
	});
}

function showLoginDialog() {
	$("#loginDialog").css({opacity: "0"});
	$("#loginDialog").css("visibility", "visible");
	$("#loginDialog").delay(200);
	$("#loginDialog").animate({opacity: "1.0"},500);
}

function showJoinDialog(){
	$("#loginDialog").css({opacity: "0"});
	$("#loginDialog").css("visibility", "visible");
	$("#loginDialog").delay(200);
	$("#loginDialog").animate({opacity: "1.0"},500);
	goJoin();
}

function showMyInfoDialog(){
	$("#loginDialog").css({opacity: "0"});
	$("#loginDialog").css("visibility", "visible");
	$("#loginDialog").delay(200);
	$("#loginDialog").animate({opacity: "1.0"},500);
	goMyInfo();
}

function goMyInfo(){
	$.ajax({
		url : "userEdit.do",
		type : "get",
		dateType : "html",
		success : function(result) {
			$(".loginBox").css({opacity: "0"});
			$(".loginBox").html(result);
			$(".loginBox").delay(500);
			$(".loginBox").animate({opacity: "1.0"},500);
		}
	});
}

function goJoin(){
	$.ajax({
		url : "join.do",
		type : "get",
		dateType : "html",
		success : function(result) {
			$(".loginBox").css({opacity: "0"});
			$(".loginBox").html(result);
			$(".loginBox").delay(500);
			$(".loginBox").animate({opacity: "1.0"},500);
		}
	});
}

/** </script> * */
