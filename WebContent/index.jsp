<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Fredoka+One|Julius+Sans+One|Monoton" rel="stylesheet">
<style type="text/css">
#videobcg { 
     position: absolute;
     top: 0px;
     left: 0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: auto;
     z-index: -1000;
     overflow: hidden;
}
#wrapContent{
	position: absolute;
     top: 0px;
     left: 0px;
     bottom:0px;
     min-width: 100%;
     min-height: 100%;
     width: auto;
     height: 100%;
     /* background: rgba(255,167,167,0.2); /* 연한핑크 */ 
  	 text-align: center;
}
h1{
	margin: 90px 90px 40px 90px;
	font-size: 5em;
	color: rgba(255,255,255,0.8);
	font-family: 'Arca Majora 3 Heavy';
	font-weight: lighter;
	/* background: rgba(0,0,0,0.2); */
	/* text-shadow: 3px 3px 0px rgba(255,100,100,1); */
	letter-spacing: 15px;
}
#t2{
	color: rgba(255,200,200,0.8);
}
#t3{
	color: rgba(255,160,160,0.8);
}
#innerWrap{
    margin: 0 auto;
	width: 400px;
	height: 300px;
	background: rgba(255,255,255,0.3);
	border-radius: 10px;
	padding: 20px;
	
}
#f1{
	width: inherit;
	height: inherit;
	font-size: 1.5em;
	color: rgba(255,255,255,0.8);
}
#f1 table{
	width: inherit;
	height: inherit;
}
td{
	text-align: center;
}
.inTxt{	
	width: 160px;
	border: 0px;
	border-bottom: 2px dashed white;
	padding-right: 10px;
	background-color:transparent;
	color: white;
	font-size: 1.1em;
}

a{
	text-decoration: none;
	color: white;
}
#btnLogin{
	width: 90%;
	height: 80%;
	background-color: rgba(255,167,167,0.9);
	border: 0px;
	border-radius: 10px;
	color: white;
	font-size: 1.2em;
	font-family: 'Arca Majora 3 Heavy';
}
#btnLogin:FOCUS{
	background-color: rgba(255,50,50,0.9);
	outline: none;
}
#btnLogin:HOVER {
	background-color: rgba(255,50,50,0.9);
}
#a0{
	text-align: right;
}
#a1, #a2{
	display: inline-block;
	margin-right: 20px;
}
#a1:HOVER, #a2:HOVER{
	color: rgba(255,50,50,0.9);
} 
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
     <source src="video/intro.ogv" type="video/ogg">    
</video>
 <div id="wrapContent">
 	<h1>Daegu<br><span id="t2">Girl-group</span><br><span id="t3">Festival</span></h1>
 	<div id="innerWrap">
 		<form action="login.do" id="f1">
 			<table>
 				<tr>
 					<td>ID</td>
 					<td><input type="text" style="" class="inTxt"></td>
 				</tr>
 				<tr>
 					<td>PW</td>
 					<td><input type="text" style="" class="inTxt"></td>
 				</tr>
 				<tr>
 					<td colspan="2"><input type="submit" value="Login" id="btnLogin"></td>
 				</tr>
 				<tr>
 					<td colspan="2" id="a0"><a href="#" id="a1">가입</a> <a href="#" id="a2">비회원</a></td>
 				</tr> 			
 			</table> 			
 		</form>
 	</div>
 	
 </div>
</body>
</html>