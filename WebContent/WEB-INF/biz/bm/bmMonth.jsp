<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		border: 2px solid black;
		border-collapse: collapse;
		
	}
	th, td{
		border:1px solid black;
		padding: 5px;
		text-align: center;
	}
	
	tr:LAST-CHILD td{
		border-bottom: 2px solid black;
		}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {		
		
	});
</script>
</head>
<body>
	<div id="wrapContent">
		<div class="bmContent">
			<table>
				<tr>
					<th>월별</th>
					<th>회차</th>
					<th>등급별 가격</th>
					<th>등급별 판매수</th>
					<th>등급별 매출</th>
					<th>총 티켓판매</th>
					<th>총 매출</th>								
				</tr>
				<c:forEach var="item" items="${bmMonth}"> <!-- 회차별 -->
					<tr>						
						<c:if test="${item.firstLine == true }">							
							<td rowspan="${item.rowCount }">
								${item.year }년 ${item.month }월
							</td>
							<td rowspan="${item.rowCount }">
						  		${item.fno }회차
							</td>							
						</c:if>
						<td>
							${item.grade } : ${item.price }원							
						</td>
						<td>
							${item.grade } : ${item.ticketCount }매							
						</td>
						<td>
							${item.grade } : ${item.sumGradePrice }원							
						</td>
						<c:if test="${item.firstLine == true }">
							<td rowspan="${item.rowCount }">
								${item.totalCount }매
							</td>
							<td rowspan="${item.rowCount }">
								${item.totalPrice }원
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div> 
	
</body>
</html>