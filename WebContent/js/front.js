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
				$("#content").css({opacity: "0"});
				$("#content").html(result);
				$("#content").delay(200);
				$("#content").animate({opacity: "1.0"},500);
			},
			error : function(){
				alert("로그인을 해야 이용할 수 있습니다.");
			}
		});
	}

	function showLoginDialog() {
		$("#loginDialog").css({opacity: "0"});
		$("#loginDialog").css("visibility", "visible");
		$("#loginDialog").delay(200);
		$("#loginDialog").animate({opacity: "1.0"},500);
	}

	function notLogin() {
		$("#loginDialog").delay(200);
		$("#loginDialog").animate({opacity: "0"}, 500);
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
				$("#community").css({opacity: "0"});
				$("#community").html(result);
				$("#community").delay(200);
				$("#community").animate({opacity: "1"},500);
			}
		});	 
	}
	
/** </script> **/
