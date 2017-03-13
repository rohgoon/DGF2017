<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<style type="text/css">

</style>
</head>
<body>
<div id="container">
	<div id="header">
		<jsp:include page="template/header.jsp"></jsp:include>
	</div>
	
	<div id="nav">
		<jsp:include page="template/nav.jsp"></jsp:include>
	</div>
	
	<div id="content">
		<p>content 영역</p>
	</div>
	
	<div id="footer">
		<jsp:include page="template/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>