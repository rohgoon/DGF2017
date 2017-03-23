<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${replys.size() == 0}">
	<h2>댓글이 없습니다. 첫 댓글을 달아보세요!</h2>
</c:if>
<ul>
	<c:if test="${replys.size() > 0}">
		<c:forEach var="reply" items="${replys}">
			<li>
				<span class="replyNo">${reply.replyNo}</span> 
				<span class="replyContent">${reply.content}</span> 
				<span class="replyWriter">${reply.uname}(${reply.id})</span> 
				<input type="button" value="작성"> <input type="button" value="수정">
				<input type="button" value="삭제"></li>
		</c:forEach>
	</c:if>
</ul>