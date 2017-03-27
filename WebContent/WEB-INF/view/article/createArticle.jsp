<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="createArticle.do" method="post">
		<p>
			<input type="text" name="uno" placeholder="userID" readonly="readonly" value="${uno}" style="display: none;">
			<input type="text" name="boardNo" placeholder="boardNo" readonly="readonly" value="${boardNo}" style="display: none;">
			<select name="category">
				<option value="전체">카테고리</option>
				<option value="공지사항">공지사항</option>
				<option value="잡담">잡담</option>
				<option value="질문">질문</option>
			</select>
		</p>
		<p><input type="text" name="title" placeholder="제목을 입력해주세요"></p>
		<p><textarea rows="15" cols="40" name="content" placeholder="내용을 입력해주세요"></textarea>
		<p><input type="file" name="attachedFile"></p>
		<p><input type="submit" value="등록"><input type="button" value="취소"></p>
	</form>
</body>
</html>