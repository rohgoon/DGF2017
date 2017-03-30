<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$(document).on("click", ".btnDel", function() {
			var del = confirm("정말로 탈퇴 시키시겠습니까?");
			if(del){
				var lnk = $(this).attr("href");
				$.ajax({
					url: lnk,
					dataType:"html",
					success:function(data){
						$(".subNavInner").css("margin-left", "5px");
						var resHtml =$(data).find(".urInner").html();
						$(".urInner").html(resHtml);
						}	
					});
				
				return false;
			}else{
				return false;
			}
		});
		
	});

</script>
</head>
<body>
<div class="subNavInner">
	<div class="urInner">
	  <table border="1">
	  	<tr>
	  		<th>유저번호</th>
	  		<th>성명</th>
	  		<th>아이디</th>
	  		<th>이메일</th>
	  		<th>전화번호</th>
	  		<th>가입일</th>
	  		<th>예매정보</th>
	  		<th>회원탈퇴<th>
	  	</tr>
	  	<c:forEach var="item" items="${userList }">
	  	<tr>
	  		<td>${item.uno }</td>
	  		<td>${item.uname }</td>
	  		<td>${item.id }</td>
	  		<td>${item.email }</td>
	  		<td>${item.phone }</td>
	  		<td>${item.regDateString }</td>
	  		<td><a href="reservationConfirm.do?uno=${item.uno }">이동</a></td>
	  		<td><a href="userDel.do?uno=${item.uno }&deLStep=2" class="btnDel">탈퇴</a></td>
	  	<tr>
	  	</c:forEach>  
	  </table>
	 </div>
 </div>
</body>
</html>