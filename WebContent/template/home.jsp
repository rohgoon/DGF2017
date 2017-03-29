<%@page import="java.util.List"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.nio.file.attribute.BasicFileAttributes"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String uploadPath = request.getRealPath("upload");
	File dir = new File(uploadPath);
	
	try{
		
		File[] files = dir.listFiles();

		Arrays.sort(files, new Comparator<File>(){
		    public int compare(File f1, File f2)
		    {
		        return Long.valueOf(f2.lastModified()).compareTo(f1.lastModified());
		    } });
		request.setAttribute("frontImgList", files);		
		
	}catch(Exception e){			

	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css?ver=4">
<link rel="stylesheet" type="text/css" href="css/common.css?ver=4">
<style type="text/css">
	body{
		font-family: 'Arca Majora 3 Heavy','12롯데마트행복Medium' !important;
	}
	
	.lineupList{
		width: 450px;
		height: 400px;
		margin: 11px;
		display: inline;
		text-align: center;
		float: left;
		line-height: 390px;
	}
	
	.lineupList a{
		font-size: 60px;
		color: #ffffff;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('.lineupList').mousedown(function() {
			
			var firstThis = $(this);
			firstThis.css("width", "1900px").css("height", "800px");
			firstThis.siblings().mousedown(function() {
				firstThis.css("width", "450px").css("height", "400px");
				$(this).css("width", "1900px").css("height", "800px");
			})
		});
	
	});
	
</script>
</head>
<body>
	
	<c:forEach var="item" items="${frontImgList }">
		<div class="lineupList">
			<%-- <a>${item.name }</a> --%>
		</div>
		
		<script type="text/javascript">
			$(function(){
				var i = 0;
				<c:forEach var="item" items="${frontImgList }">
					$(".lineupList").eq(i).css("background-image", "url(upload/${item.name})");
					$(".lineupList").eq(i).css("background-size", "cover");
					i++;
				</c:forEach>	
			});
		</script>
		
	</c:forEach>
	
	

</body>
</html>