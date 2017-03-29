/** <script> **/

	// 게시물 생성(페이지 이동)
	function createArticle(boardNo){
		$.ajax({
			url : "createArticle.do",
			type : "get",
			data : {
				"boardNo" : boardNo
			},
			dateType : "html",
			success : function(result) {
				$("#community").html(result);
			},
			error : function(){
				alert("회원만 게시물을 작성할 수 있습니다. 로그인해주세요.");
			}
		}); // ajax
	}
	
	// 게시물 작성
	function writeArticle(){
		
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
	
	// 게시물 조회
	function showArticle(boardNo, articleNo){
		$.ajax({
			url : "article.do",
			type : "get",
			data : {
				"boardNo" : boardNo,
				"articleNo" : articleNo
			},
			dateType : "html",
			success : function(result) {
				$("#community").html(result);
			},
			error : function(){
				alert("에러");
			}
		}); // ajax			
	}
	
	// 게시물 검색
	function searchArticle(boardNo){
		var sort;
		var keyword;
		$.ajax({
			url:"createReply.do",
			type:"post", 
			data: {
				"content" : $("#replyContent").val(),
				"articleNo" : articleNo,
				"boardNo" : boardNo,
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

	// 게시물 수정
	function updateArticle(obj, articleNo, boardNo){
		var btn = $(obj);
		var title = $("input[name='title']");
		var category = $("select[name='category']");
		var content = $("textarea[name='content']");
		
		if(btn.val() == "수정"){
			btn.val("완료");
			title.removeAttr("readonly");
			category.removeAttr("disabled");
			content.removeAttr("readonly");
			alert("게시물을 수정해주세요");
		}else if(btn.val() == "완료"){
			$.ajax({
				url : "updateArticle.do",
				type : "post",
				data : {
					"articleNo" : articleNo,
					"boardNo" : boardNo,
					"content" : content.val(),
					"category" : category.val(),
					"title" : title.val()
						},
				dateType: "html",
				success:function(result){
					alert("게시물 수정에 성공했습니다.");
					loadBoard(boardNo);
				}
			});
		}
	}
	
	// 게시물 삭제
	function deleteArticle(articleNo, boardNo){
		if(confirm("정말 삭제하시겠습니까?") == true){
			$.ajax({
				url : "deleteArticle.do",
				type : "post",
				data : {
					"articleNo" : articleNo,
					"boardNo" : boardNo
						},
				dateType: "html",
				success:function(result){
					alert("게시물 삭제에 성공했습니다.");
					loadBoard(boardNo);
				}
			});
		}else{
			return;
		}
	}//deleteArticle
	
	// 게시물 추천
	function recommendArticle(articleNo, boardNo, uno){
		$.ajax({
			url:"articleRec.do",
			type:"post", 
			data: {
				"articleNo" : articleNo,
				"boardNo" : boardNo,
				"uno" : uno
			},
			dateType: "html",
			success:function(result){
				alert("게시물을 추천했습니다.");
			},
			error:function(){
				alert("이미 추천하셨습니다.");
			}
		});	
	}



	
	// 페이지 이동
	function pageMove(category, boardNo, page, rowNum){
		
		if(category == null || category == "카테고리" || category == "전체"){
			$.ajax({
				url : "articleList.do",
				type : "get",
				data : {
					"boardNo" : boardNo,
					"rowNum" : rowNum,
					"page" : page
				},
				dateType : "html",
				success : function(result) {
					$("#community").html(result);
				},
				error : function(){
					alert("에러 발생 다시 시도해주세요");
				}
			}); // ajax
		}else{
			$.ajax({
				url : "articleList.do",
				type : "get",
				data : {
					"boardNo" : boardNo,
					"rowNum" : rowNum,
					"page" : page,
					"category" : category
				},
				dateType : "html",
				success : function(result) {
					$("#community").html(result);
				},
				error : function(){
					alert("에러 발생 다시 시도해주세요");
				}
			}); // ajax
		}
	}
	





	// 리플 생성
	function createReply(parent, articleNo, boardNo){
		var indent;
		
		if(parent == 0){
			indent = 0;
		}else{
			indent = 1;
		}
		
		$.ajax({
			url:"createReply.do",
			type:"post", 
			data: {
				"content" : $("#replyContent").val(),
				"articleNo" : articleNo,
				"boardNo" : boardNo,
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
	
	// 리플 삭제
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
	
	
	// 리플 수정
	function updateReply(obj, replyNo, articleNo, boardNo){
		var inp = $(obj).parent().children("input[type='text']"); // 텍스트 입력란
		var content = inp.val();
		
		if($(obj).val() == "수정"){
			inp.focus();
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
	
	// 리플 추천
	function recReply(uno, replyNo, articleNo, boardNo){
		$.ajax({
			url:"replyRec.do",
			type:"post", 
			data: {
				"articleNo" : articleNo,
				"boardNo" : boardNo,
				"replyNo" : replyNo,
				"uno" : uno
			},
			dateType: "html",
			success:function(result){
				alert("댓글을 추천했습니다.");
			},
			error:function(){
				alert("이미 추천하셨습니다.");
			}
		});	
	}

	
	
	
/** </script> **/
