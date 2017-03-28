/** <script> **/

	function movepage(obj) {
		var page = $(obj).html();
		$.ajax({
			url : "movePage.do",
			type : "get",
			data : {
				"page" : page
			},
			dateType : "html",
			success : function(result) {
				$("#content").html(result);
			},
			error : function(){
				alert("로그인을 해야 이용할 수 있습니다.");
			}
		});
	}

	function showLoginDialog() {
		$("#loginDialog").css("visibility", "visible");
	}

	function notLogin() {
		$("#loginDialog").css("visibility", "hidden");
	}

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
	
/** </script> **/
