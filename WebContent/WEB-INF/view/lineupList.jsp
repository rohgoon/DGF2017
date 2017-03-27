<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
<style type="text/css">
	/*-------------------------- div type list css --------------------------*/
	.outter{
		width: 100%;
		height: 800px;
		padding-top: 50px;
	}
	
	.outter:NTH-CHILD(1){
		background: url("img/redvelvet/redvelvet02.jpg") no-repeat;
		background-size: cover;
	}
	
	.outter:NTH-CHILD(2){
		background: url("img/apink/apink04.jpg") no-repeat;
		background-size: cover;
	}
	
	.outter:NTH-CHILD(3){
		background: url("img/blackpink/blackpink06.jpg") no-repeat;
		background-size: cover;
	}
	
	.outter:NTH-CHILD(4){
		background: url("img/mamamoo/mamamoo05.jpg") no-repeat;
		background-size: cover;
	}
	
	.outter:NTH-CHILD(5){
		background: url("img/aoa/aoa03.jpg") no-repeat;
		background-size: cover;
	}
	
	.outter:NTH-CHILD(6){
		background: url("img/twice/twice06.jpg") no-repeat;
		background-size: cover;
	}
	
	.inner{
		width: 550px;
		height: 650px;
		background-color: rgba( 255, 255, 255, 0.9);
		padding: 10px;
		margin-left: 1200px;
	}
	
	.aname{
		width: 97%;
		height: 70px;
		clear: both;
		padding: 10px;
	}
	
	.aname a{
		font-size: 40px;
		color:#000000;
	}
	
	.contents{
		width: 320px;
		height: 530px;
		display: inline;
		float: left;
		padding: 10px;
	}
	
	.song{
		width: 180px;
		height: 530px;
		display: inline;
		float: right;
		border-left: 1px solid #000000;
		padding: 10px;
	}
	
	.song a{
		display: block;
	}
	
	/*-------------------------- day nav bar css --------------------------*/
	.dayNav{
		width: 70px;
		height: 100px;
		position: fixed;
		bottom: 300px;
		padding: 10px;
		border-top-right-radius: 20px;
		border-bottom-right-radius: 20px;
		border: 1px solid #FF4081;
		color: #000000;
		background-color: rgba( 255, 255, 255, 0.9);
		box-shadow: 3px 3px 0px #4C4C4C;
	}
	
	.dayNav a{
		font-size: 20px;
		display: block;
		margin-bottom: 20px;
	}
	
	.dayNav a:HOVER {
		color: #FF4081;
	}
	
	
	/*-------------------------- table css --------------------------*/
	/* table {
		border: 1px solid #000000;
		border-collapse: collapse;
	}
	
	tr,td,th{
		border: 1px solid #000000;
	} */
</style>
</head>
<body>
<div id="container">
	<div id="header">
		<div id="nav">
			<jsp:include page="../../template/nav.jsp"></jsp:include>
		</div>
		
		<div id="login">
			<jsp:include page="../../template/login.jsp"></jsp:include>
		</div>
	</div>
	

	<div id="title">
		<jsp:include page="../../template/title.jsp"></jsp:include>
	</div>

	<div id="content">
		
		<%-- <h1>DGF 라인업 정보</h1>
			<a href="lineupRegister.do">새 라인업 등록</a>
			<table>
				<tr>
					<th>출연진 번호</th>
					<th>일정 번호</th>
					<th>아티스트 이름</th>
					<th>아티스트 설명</th>
					<th>대표곡1</th>
					<th>대표곡2</th>
					<th>대표곡3</th>
				</tr>
				
			<c:forEach var="item" items="${viewList }">
				<tr>
					<td><a href="lineupSelected.do?lno=${item.lno }">${item.lno }</a></td>
					<td>${item.dno }</td>
					<td>${item.aname }</td>
					<td>${item.contents }</td>
					<td>${item.song1 }</td>
					<td>${item.song2 }</td>
					<td>${item.song3 }</td>
				</tr>
			</c:forEach>	
				
			</table> --%>
			
	<!------------------------------- div type list ------------------------------->
	<c:forEach var="item" items="${viewList }">
		<div class="outter">
			<div class="inner">
				<div class="aname">
					<a>${item.aname }</a>
				</div>
				
				<div class="contents">
					<a>${item.contents }</a>
				</div>
				
				<div class="song">
					<a>1. ${item.song1 }</a>
					<a>2. ${item.song2 }</a>
					<a>3. ${item.song3 }</a>
					<c:forEach var="item" items="${file }">
						<img src="upload/${item }">
					</c:forEach>
				</div>
			</div>
		</div>
	</c:forEach>
	
	</div>

	
	<!------------------------------- day nav bar ------------------------------->
	<div class="dayNav">
		<a id="dayNav1">DAY1</a>
		<a id="dayNav2">DAY2</a>
		<a id="dayNav3">DAY3</a>
	</div>
	
	<%-- <div id="footer">
		<jsp:include page="../../template/footer.jsp"></jsp:include>
	</div> --%>
	
	
	<!--------------------------- test div ----------------------------------->
	<c:forEach var="item" items="${file }">
		<img src="upload/${item}"></a><br>
	</c:forEach>
</div>
</body>
</html>