<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${replys.size() == 0}">
	<h2 style="margin-top:20px;">댓글이 없습니다. 첫 댓글을 달아보세요!</h2>
</c:if>


<ul>
	<c:if test="${replys.size() > 0}">
		<c:forEach var="reply" items="${replys}">
			<li>
				<span class="replyNo">${reply.replyNo}</span>
				<input type="text" class="replyContent" readonly="readonly" value="${reply.content}"></span>
				<span class="replyWriter">${reply.uname}(${reply.id})</span> 
				<input type="button" value="추천" onclick="recReply(${sessionScope.auth.uno}, ${reply.replyNo}, ${reply.articleNo}, ${reply.boardNo});">
				<input type="button" value="작성" onclick="createReply(${reply.replyNo}, ${reply.articleNo}, ${reply.boardNo});">
				<c:if test="${reply.uno == sessionScope.auth.uno}">
					<input type="button" value="수정" onclick="updateReply(this, ${reply.replyNo}, ${reply.articleNo}, ${reply.boardNo});">
					<input type="button" value="삭제" onclick="deleteReply(${reply.replyNo}, ${reply.articleNo}, ${reply.boardNo})">
				</c:if>
			</li>
		</c:forEach>
	</c:if>
</ul>