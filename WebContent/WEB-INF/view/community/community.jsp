<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	function loadBoard(boardNo){
		$.ajax({
			url:"articleList.do?rowNum=10&page=1",
			type:"post",
			data: {
				"boardNo" : boardNo
			},
			dateType: "html",
			success:function(result){
				$("#community").html(result);	
			}
		});	 
	}
</script>
<style type="text/css">
	table {
		border-collapse: collapse;
	}
	
	th{
		background-color: #FFD9FA;
	}
	#innerNav{
		height : 100%;
		width: 10%;
		float:left;
	}
	#commnuity{
		height:100%;
		width:70%;
	}
	
	
	
	.button{
		height: 100%;
		display: inline;
	}

	.button{
		text-decoration: none;
		margin: 10px;
		padding: 10px;
		display: block;
		font-size: 20px;
		color: #000000;
		border: 1px solid #000000;
		text-align: center;
	}

	.button:HOVER{
		color: #ffffff;
		background-color: #F48FB1;
	}
</style>
</head>
<body>
<div id="container">

	<div id="header">
		<div id="nav">
			<jsp:include page="../../../template/nav.jsp"></jsp:include>
		</div>
		
		<div id="login">
			<jsp:include page="../../../template/login.jsp"></jsp:include>
		</div>
	</div>
	

	<div id="title">
		<jsp:include page="../../../template/title.jsp"></jsp:include>
	</div>
	
	<div id="content">
		<div id="innerNav">
			<c:if test="${boardList.size() > 0 }">
				<c:forEach var="board" items="${boardList}">
					<p>
						<a class="button" onclick="loadBoard(${board.boardNo});">${board.boardName}</a>
					</p>
				</c:forEach>
			</c:if>
		</div>
		<div id="community">
			
		</div>
	</div>
	
	<div id="footer">
		<jsp:include page="../../../template/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>