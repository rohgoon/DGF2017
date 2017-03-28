<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var grade = new Array();
		var gradePrice = new Array();
		var gradeTicket = new Array();
		$(document).on("click", "#btnAdd",function() {
			$("#gt").append('<tr class="addTr"><th>'+
					'<label>등급 : </label>'+				
					'<input type="text" placeholder="s" class="grade">'+
					'</th><th>'+
					'<label>가격 : </label>'+				
					'<input type="number" placeholder="100000" class="price">원'+
					'</th><th>'+
					'<label>발행매수 : </label>'+				
					'<input type="number" placeholder="50" class="ticket">매</th></tr>'
					);			
		});
		$(document).on("click","#btnDel", function() {
			if($(".addTr").length > 1){
				$(".addTr").eq($(".addTr").length-1).remove();			
			}			
		});
		$("#btnNext").click(function() {
			var num=0;
			$(".checkNum").each(function(i, element) {
				if($(element).val() == ""){
					num++;
					}
			});
			if(num>0){
				alert("내용을 입력해 주세요");
				return false;
			}else{
				return true;
				}			
			
		});
		
	});
</script>
</head>
<body>
<div id="wrapContent">
	<form action="afNew.do?no=2" method="post" id="afnForm1">
		<label for="sdate">시작일</label>
		<input type="date" name="sdate" id="sdate" class="checkNum">
		~
		<label for="edate">마감일</label>
		<input type="date" name="edate" id="edate" class="checkNum">
		<hr>
		<label for="place">장소</label>
		<input type="text" name="place" id="place" class="checkNum">
		<hr>
		<h3>티켓 등급 설정
			<input type="button" value="등급추가" id="btnAdd">
			<input type="button" value="등급삭제" id="btnDel">
		</h3>
		<table border="1" id="gt">
			<tr class="addTr">
				<th>
					<label>등급 : </label>				
					<input type="text" placeholder="s" class="grade" name="grade" class="checkNum">
				</th>		
				<th>
					<label>가격 : </label>				
					<input type="number" placeholder="100000" class="price" name="price" class="checkNum">원
				</th>			
				<th>
					<label>발행매수 : </label>				
					<input type="number" placeholder="50" class="ticket" name="ticket" class="checkNum">매
				</th>
			</tr>			
		</table>
		<hr>
		<input type="submit" value="다음" id="btnNext">
		
	</form>
</div>
</body>
</html>