<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<tr>
		<th>연도</th>
		<th>티켓등급</th>
		<th>티켓 판매수</th>
		<th>티켓별 매출</th>
		<th>총 매출</th>
	</tr>
	<c:forEach var="item" items="${bmYear}">
		<tr>
			<td>${item.year }</td>
			<td>${item.grade }</td>
			<td>${item.ticketCount }</td>
			<td class="yTotalCount">${item.totalCount }</td>
			<td class="yTotalPrice">${item.totalPrice }</td>
		</tr>
	</c:forEach>
</table>