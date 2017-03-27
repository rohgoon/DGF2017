<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/reset.css?ver=1">
<link rel="stylesheet" type="text/css" href="css/front.css?ver=1">
<style type="text/css">
@font-face{ 
	font-family: 'Arca Majora 3 Heavy';
	 src:url(font/ArcaMajora3-Heavy.otf); 
	} 
	body{
		font-family: 'Arca Majora 3 Heavy', '12롯데마트행복Medium';
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<div id="container">
	<div id="header">
		<div id="nav">
			<jsp:include page="template/nav.jsp"></jsp:include>
		</div>
		
		<div id="login">
			<jsp:include page="template/login.jsp"></jsp:include>
		</div>
	</div>
	

	<div id="title">
		<jsp:include page="template/title.jsp"></jsp:include>
	</div>

	<div id="content">
		<div id="day1">
			<div class="day1"></div>
			<div class="day1"></div>
			<div class="day1"></div>
			<div class="day1"></div>
			<div class="day1"></div>
		</div>
		
		<div id="day2">
			<div class="day2"></div>
			<div class="day2"></div>
			<div class="day2"></div>
			<div class="day2"></div>
			<div class="day2"></div>
		</div>
		
		<div id="day3">
			<div class="day3"></div>
			<div class="day3"></div>
			<div class="day3"></div>
			<div class="day3"></div>
			<div class="day3"></div>
		</div>
		
	</div>
	
	<div id="footer">
		<jsp:include page="template/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>