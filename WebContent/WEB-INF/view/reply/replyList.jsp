<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${replys.size() == 0}">
	<h2>댓글이 없습니다. 첫 댓글을 달아보세요!</h2>
</c:if>
<ul>
	<c:if test="${replys.size() > 0}">
		<c:forEach var="reply" items="${replys}">
			<li>
				<span class="replyNo">${reply.replyNo}</span> 
				<input type="text" class="replyContent" readonly="readonly" value="${reply.content}"></span> 
				<span class="replyWriter">${reply.uname}(${reply.id})</span> 
				<input type="button" value="작성">
				<c:if test="${reply.uno == sessionScope.auth.uno}">
					<input type="button" value="수정" onclick="updateReply(this, ${reply.replyNo}, ${reply.articleNo}, ${reply.boardNo});">
					<input type="button" value="삭제" onclick="deleteReply(${reply.replyNo}, ${reply.articleNo}, ${reply.boardNo})">
				</c:if>
			</li>
		</c:forEach>
	</c:if>
	<script>
	function deleteReply(replyNo, articleNo, boardNo){
		$.ajax({
			url:"deleteReply.do",
			type:"post", 
			data: {
				"articleNo" : articleNo,
				"boardNo" : boardNo,
				"replyNo" : replyNo
			},
			dateType: "html",
			success:function(result){
				alert("댓글을 삭제했습니다.");
				$("#replyList").html(result);
			}
		});	
	}
	
	
	function updateReply(obj, replyNo, articleNo, boardNo){
		var inp = $(obj).parent().children("input[type='text']"); // 텍스트 입력란
		var content = inp.val();
		
		if($(obj).val() == "수정"){
			
			$(obj).val("완료");
			inp.removeAttr("readonly");
			
		}else if($(obj).val() == "완료"){
			$.ajax({
				url:"updateReply.do",
				type:"post", 
				data: {
					"articleNo" : articleNo,
					"boardNo" : boardNo,
					"replyNo" : replyNo,
					"content" : content
				},
				dateType: "html",
				success:function(result){
					alert("댓글을 수정했습니다.");
					$("#replyList").html(result);
					$(obj).val("수정").attr({"readonly":"readonly"});

				}
			});	
		}	
	}	
	</script>
</ul>