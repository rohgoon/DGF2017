<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String newDate = sdf.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		border-collapse: collapse;
	}
	table tr, td{
		padding: 10px;
		text-align: center;
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {		
		/* $("#bmYear").on("submit", function() {
			var d = $(this).serialize();		
			$.ajax({
				url: "bmDate.do?bm=year",
				type: "get",
				data: "d",
				dataType: "html",
				success:function(bm){
					$("#divForYear").html(bm);
				}
	
			});//ajax */
		});
		
		
	});
</script>
</head>
<body>
	<nav> 
		<ul>
			<li class="bmNav">회차별 매출액</li>
			<li class="bmNav">연도별 매출액</li>
			<li class="bmNav">월별 매출액</li>
			<li class="bmNav">주별 매출액</li>
			<li class="bmNav">일별 매출액</li>		
		</ul>		
	</nav>
	<div id="wrapContent">
		<div class="bmContent">
			<table border="1">
				<tr>
					<th>회차</th>
					<th>기간</th>
					<th>총 티켓판매</th>
					<th>총 매출</th>
					<th>등급별 판매수</th>
					<th>등급별 매출</th>			
				</tr>
				<c:forEach var="item" items="${bmFestivals}"> <!-- 회차별 -->
					<tr>
						<c:if test="${item.firstLine == true }">
							<td rowspan="3">
						  	${item.fno }회차
							</td>
							<td rowspan="3">
								${item.sdayString }~${item.edayString }
							</td>
							<td rowspan="3">
								${item.totalCount }장
							</td>
							<td rowspan="3">
								${item.totalPrice }원
							</td>
						</c:if>
						<c:if test="${item.firstLine == false }">
							
						</c:if>
						<td>
							${item.grade } : ${item.ticketCount }장							
						</td>
						<td>
							${item.grade } : ${item.sumGradePrice }원							
						</td>
						
					</tr>
				</c:forEach>
			</table>
		</div>
		<%-- <div class="bmContent">
			<form action="bmYear.do" method="post" id="bmYear">
				<input type="date" name="sdate" value="${newDate }" id="sdate">-<input type="date" name="edate" value="${newDate }" id="edate"> 
				<input type="submit" value="검색">
			</form><hr>
			<!-- ajax 활용 -->
			<div id="divForYear">				
			</div>
		</div> --%>		
	</div> 
	
</body>
</html>