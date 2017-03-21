<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<p>
		<select name="category">
			<option>전체</option>
			<option>공지사항</option>
			<option>잡담</option>
			<option>질문</option>
		</select>
		<h2>${articleCount}개의 게시물이 있습니다.</h2>
	</p>
	
	<table>
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>
		
		
		
		<c:if test="${articleList.size() == 0}">
			<tr>
				<td colspan="6">게시물이 없습니다.</td>
			</tr>
		</c:if>

		
		<c:forEach var="article" items="${articleList}">
				<tr>
					<td>${article.articleNo}</td>
					<td>${article.category}</td>
					<td><a href="article.do?boardNo=${boardNo}&articleNo=${articleNo}">${article.title}</a></td>
					<td><a href="">${article.name}(${article.id})</a></td>
					<td>${article.writeTime}</td>
					<td>${article.hits}</td>
					<td>${article.recommend}</td>					
				</tr>
		</c:forEach>
		
		
		
		
		
	</table>
	<p>
		<c:forEach begin="1" end="${totalPage}" var="page">
			<a href="">${page}</a>
		</c:forEach>
	</p>
	
	
	
	
	
	<p>
		<select name="searchby">
			<option>전체</option>
			<option>제목</option>
			<option>제목+내용</option>
			<option>내용</option>
			<option>작성자</option>
		</select>
		<input type="search" name="search">
		<input type="button" value="검색">
	</p>
</body>
</html>