<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<a href="createBoard.do">게시판 만들기<a>
		<c:if test="${boardList.size() == 0}">
			<h1>등록된 게시판이 없습니다. 게시판을 만들어주세요.</h1>
		</c:if>	
		<c:if test="${boardList.size() > 0 }">
			<table border="1">
				<tr>
					<th>번호</th>
					<th>프로젝트 이름</th>
					<th></th>
				</tr>
			<c:forEach var="board" items="${boardList}">
				<tr>
					<td>${board.boardNo}</td>
					<td><a href="articleList.do?boardNo=${board.boardNo}&rowNum=10&page=1">${board.boardName}</a></td>
					<td><a href="deleteBoard.do?boardNo=${board.boardNo}">삭제</a><a href="updateBoard.do?boardNo=${board.boardNo}">수정</a>
				</tr>
			</c:forEach>
			</table>		
		</c:if>
</body>
</html>