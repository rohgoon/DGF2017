<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$.ajax({
		url:"readReply.do",
		type:"get", 
		data: {
			"articleNo" : ${article.articleNo},
			"boardNo" : ${article.boardNo}
		},
		dateType: "html",
		success:function(result){
			$("#replyList").html(result);
		}
	});	
	
	function createReply(parent){
		var parent;
		var indent;
		
		if(parent = 0){
			indent = 0;
		}else{
			indent = 1;
		}
	
		$.ajax({
			url:"createReply.do",
			type:"post", 
			data: {
				"content" : $("#content").val(),
				"articleNo" : ${article.articleNo},
				"boardNo" : ${article.boardNo},
				"parent" : parent,
				"indent" : indent
			},
			dateType: "html",
			success:function(result){
				alert("댓글작성에 성공했습니다.");
				$("#replyList").html(result);
			}
		});	
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="article">
		<p>
			<label>글쓴이</label>${article.uname}(${article.id})</p>
		<p>
			<label>제 목</label>${article.title}</p>
		<p>
			<label>날 짜</label>${article.writeTime}</p>
		<p>
			<label>카테고리</label>${article.category}</p>
		<p>
			<label>조회수</label>${article.hits}</p>
		<p>
			<label>추천수</label>${article.recommend}</p>
		<p>
			<label>내 용</label>
		</p>
		<p>
			<textarea rows="20" cols="60">${article.content}</textarea>
		</p>
		<p>
			<input type="button" value="목록"><input type="button"
				value="수정"><input type="button" value="삭제"><input
				type="button" value="글쓰기">
		</p>
	</div>

	<div id="reply">
		<p>
			<textarea rows="1" cols="60" id="content"></textarea>
			<input type="button" value="댓글쓰기" onclick="createReply(0);">
		</p>
		<div id="replyList">
		</div>
	</div>
</body>
</html>