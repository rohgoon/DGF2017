<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	table{
		table-layout: fixed !important;
		width:500px !important;
		margin-left: 0 !important;
		
	}
	table th, td{
		border: 1px solid black;
	}
	td{
		text-align: left;
	}
	#aith{
	    vertical-align: middle;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document)

</script>
</head>
<body>
	<div id="wrapContent">				
			<table>
				<tr>
					<th>회차</th>
					<th>일정번호</th>
					<th>날짜</th>
					<th>시작시간</th>
					<th>마감시간</th>
					<th>이동</th>
				</tr>	
				<c:forEach var="item" items="${days }"> 				
					<tr>
						<td>${item.fno }</td>
						<td>${item.dno }</td>
						<td>${item.dayString }</td>
						<td>${item.stime }</td>
						<td>${item.etime }</td>
						<td><a href="registerStep.do?step=2&dno=${item.dno }" class="btnStep">선택</a></td>
					</tr>
				</c:forEach>
			</table>	
	</div>
</body>
</html>