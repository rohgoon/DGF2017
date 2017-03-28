<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table>

	<tr>
		<th>검색기간</th>
		<th>해당일</th>
		<th>회차</th>
		<th>등급별 가격</th>
		<th>해당기간 총 티켓판매</th>
		<th>해당기간 총 매출</th>
	</tr>
	<c:forEach var="item" items="${bmSearch}">
		<tr>
			<c:if test="${item.firstLine == true }">
				<td rowspan="${bmSearch.size() }">${sdate }~${edate }</td>
			</c:if>
				<td>${item.year }년${item.month }월${item.nowday }일</td>
				<td>${item.fno }회차</td>
				<td>${item.grade }:${item.price }원</td>
			<c:if test="${item.firstLine == true }">
				<td rowspan="${bmSearch.size() }">${item.totalCount }매</td>
				<td rowspan="${bmSearch.size() }">${item.totalPrice }원</td>
			</c:if>
		</tr>
	</c:forEach>

</table>