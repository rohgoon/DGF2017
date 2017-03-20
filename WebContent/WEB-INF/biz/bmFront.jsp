<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$('.bmContent').css('display', 'none');
	$('.bmContent').eq(0).css('display', 'block');
	$(document).ready(function() {
		$('.bmNav').each(function(i, element) {
			$(element).click(function() {
				$('.bmContent').css('display', 'none');
				$('.bmContent').eq(i).css('display', 'block');			
			}); 
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
			<table>
				<tr>
					<th>회차</th>
					<th>기간</th>
					<th>티켓 등급</th>
					<th>등급별 판매수</th>
					<th>등급별 매출</th>
					<th>총 판매수</th>
					<th>총 매출</th>			
				</tr>
				<c:forEach var="item" items="${bmFestival}"> <!-- 회차별 -->
					<tr>
						<td>
						  	${item.fno }회차
						</td>
						<td>
							${item.sday }~${item.eday }
						</td>
						<td>
							${item.sno } <!-- 핸들러에서 sno로 티켓 장수를 임의로 넣음 -->
						</td>
						<td>
							${item.price }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="bmContent">
			<table>
				<tr>
					<th>연도</th>
					<th>티켓 등급</th>
					<th>등급별 판매수</th>
					<th>등급별 매출</th>
					<th>총 매출</th>			
				</tr>
				<c:forEach var="item" items="${bmYear}"> <!-- 회차별 -->
					<tr>						
						<td>
							${item.sday }
						</td>
						<td>
							${item.sno } <!-- 핸들러에서 sno로 티켓 장수를 임의로 넣음 -->
						</td>
						<td>
							${item.price }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="bmContent">
			<table>
				<tr>
					<th>월</th>
					<th>티켓 등급</th>
					<th>등급별 판매수</th>
					<th>등급별 매출</th>
					<th>총 매출</th>			
				</tr>
				<c:forEach var="item" items="${bmMonth}"> <!-- 회차별 -->
					<tr>						
						<td>
							${item.sday }
						</td>
						<td>
							${item.sno } <!-- 핸들러에서 sno로 티켓 장수를 임의로 넣음 -->
						</td>
						<td>
							${item.price }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="bmContent">
			<table>
				<tr>
					<th>주</th>
					<th>티켓 등급</th>
					<th>등급별 판매수</th>
					<th>등급별 매출</th>
					<th>총 매출</th>			
				</tr>
				<c:forEach var="item" items="${bmWeek}"> <!-- 회차별 -->
					<tr>						
						<td>
							${item.sday }
						</td>
						<td>
							${item.sno } <!-- 핸들러에서 sno로 티켓 장수를 임의로 넣음 -->
						</td>
						<td>
							${item.price }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="bmContent">
			<table>
				<tr>
					<th>일</th>
					<th>티켓 등급</th>
					<th>등급별 판매수</th>
					<th>등급별 매출</th>
					<th>총 매출</th>			
				</tr>
				<c:forEach var="item" items="${bmDay}"> <!-- 회차별 -->
					<tr>						
						<td>
							${item.sday }
						</td>
						<td>
							${item.sno } <!-- 핸들러에서 sno로 티켓 장수를 임의로 넣음 -->
						</td>
						<td>
							${item.price }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
</body>
</html>