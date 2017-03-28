<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	table{
		table-layout: fixed !important;
		width:300px !important;
		margin-left: 0 !important;
		
	}
	table th, td{
		border: 1px solid black;
	}
	
</style>
</head>
<body>
<div id="wrapContent">
	<form action="updateBoard.do" method="post">
		<table>
			<tr>
				<th>게시판 수정</th>
			</tr>			
			<tr>
				<td><input type="text" name="boardNo" value="${param.boardNo}" readonly="readonly"></td>
			</tr>
			<tr>
				<td><input type="text" name="boardName" placeholder="수정할 이름을 넣으세요"></td>
			</tr>		
		</table>
		<br><br>
		<input type="submit"> <input type="button" value="뒤로" onclick="goBack();">
		<script>
			function goBack(){
				location.href="readBoardList.do";
			}
		</script>
	</form>
</div>
</body>
</html>