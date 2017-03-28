<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="innerNav">
	<c:if test="${boardList.size() > 0 }">
		<c:forEach var="board" items="${boardList}">
				<a class="button" onclick="loadBoard(${board.boardNo});">${board.boardName}</a>
		</c:forEach>
	</c:if>
</div>

<div id="community"></div>
