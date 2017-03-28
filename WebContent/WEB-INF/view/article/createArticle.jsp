<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
		<p>
			<input type="text" name="uno" placeholder="userID" readonly="readonly" value="${uno}" style="display: none;">
			<input type="text" name="boardNo" placeholder="boardNo" readonly="readonly" value="${boardNo}" style="display: none;">
			<select name="category">
				<option value="전체">카테고리</option>
				<option value="공지사항">공지사항</option>
				<option value="잡담">잡담</option>
				<option value="질문">질문</option>
			</select>
			<input type="text" name="title" placeholder="제목을 입력해주세요">
		</p>
		<p><textarea rows="15" cols="40" name="content" placeholder="내용을 입력해주세요"></textarea>
		<p><input type="file" name="attachedFile"></p>
		<p><input type="submit" value="등록" onclick=createArticle();><input type="button" value="취소" onclick="loadBoard(${boardNo});"></p>
</body>
<script>
	function createArticle(){
		
		var uno = $("input[name='uno']").val();
		var boardNo = $("input[name='boardNo']").val();
		var category = $("select[name='category']").val();
		var title = $("input[name='title']").val();
		var content = $("textarea[name='content']").val();
		var attachedFile = $("input[name='attachedFile']").val();
		
		$.ajax({
			url:"createArticle.do",
			type:"post", 
			data: {
				"uno" : uno,
				"boardNo" : boardNo,
				"category" : category,
				"title" : title,
				"content" : content,
				"attachedFile" : attachedFile
			},
			dateType: "html",
			success:function(result){
				alert("게시물을 작성했습니다.");
				$("#community").html(result);
			},
			error:function(){
				alert("회원만 작성할 수 있습니다.");
			}
		});	
	} // createArticle
</script>
