<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시판 만들기</h2>
	<form action="createBoard.do" method="post">
		<p><input type="text" name="boardName" placeholder="게시판 이름을 입력하세요"></p>
		<p><input type="submit"><input type="button" value="뒤로" onclick="goBack();"></p>
		<script>
			function goBack(){
				location.href="readBoardList.do";
			}
		</script>
	</form>
</body>
</html>