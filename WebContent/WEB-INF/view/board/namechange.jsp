<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시판 수정</h2>
	<form action="updateBoard.do" method="post">
		<p><input type="text" name="boardNo" value="${param.boardNo}" readonly="readonly">
		<p><input type="text" name="boardName" placeholder="수정할 이름을 넣으세요"></p>
		<p><input type="submit"><input type="button" value="뒤로" onclick="goBack();"></p>
		<script>
			function goBack(){
				location.href="readBoardList.do";
			}
		</script>
	</form>
</body>
</html>