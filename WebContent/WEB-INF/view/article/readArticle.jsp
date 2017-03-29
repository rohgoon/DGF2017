<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="articleContent">

	<div id="aInfo">
		<p> 
			<input type="text" value="${article.title}" name="title" readonly="readonly">
			<span><label class="lblRow">카테고리</label> 
				<select name="category" disabled="disabled">
					<option value="공지사항" <c:if test="${article.category == '공지사항'}"> selected="selected"</c:if>>공지사항</option>
					<option value="잡담"  <c:if test="${article.category == '잡담'}"> selected="selected"</c:if>>잡담</option>
			 		<option value="질문" <c:if test="${article.category == '질문'}"> selected="selected"</c:if>>질문</option>
				</select>
			</span>
		</p>
		
		<p>
			<span>글쓴이 : ${article.uname}(${article.id})</span>
			<span>날짜 : ${article.writeTime}</span>
			<span>조회수 : ${article.hits}</span>
			<span>추천수 : ${article.recommend}</span>
		</p>
	</div>

	<p><textarea rows="30" cols="100" readonly="readonly" name="content">${article.content}</textarea></p>

	<p>
		<input type="button" value="목록" class="raBtn">
		<c:if test="${article.uno == sessionScope.auth.uno}">
			<input type="button" value="수정" onclick="updateArticle(this);" class="raBtn">
			<input type="button" value="삭제" onclick="deleteArticle();" class="raBtn">
		</c:if>
		<input type="button" value="추천하기" class="raBtn">
		<input type="button" value="글쓰기" class="raBtn">
	</p>

</div>
<br><br>
<h2 style="text-align:left;">Reply</h2>
<div id="replyArea">
	<p>
		<textarea rows="5" cols="60" id="replyContent"></textarea>
		<input type="button" value="댓글쓰기" onclick="createReply(0);" id="replyCreate">
	</p>
	<div id="replyList"></div>
</div>






<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
				"content" : $("#replyContent").val(),
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
	
	function deleteArticle(){
		if(confirm("정말 삭제하시겠습니까?") == true){
			$.ajax({
				url : "deleteArticle.do",
				type : "post",
				data : {
					"articleNo" : ${article.articleNo},
					"boardNo" : ${article.boardNo}
						},
				dateType: "html",
				success:function(result){
					alert("게시물 삭제에 성공했습니다.");
					location.replace("articleList.do?boardNo="+${article.boardNo}+"&rowNum=10&page=1");
				}
			});
		}else{
			return;
		}
	}//deleteArticle
	
	function updateArticle(obj){
		var btn = $(obj);
		var title = $("input[name='title']");
		var category = $("select[name='category']");
		var content = $("textarea[name='content']");
		
		
		if(btn.val() == "수정"){
			btn.val("완료");
			
		}
		
	}
</script>
