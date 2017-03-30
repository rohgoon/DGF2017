/** <script> **/

	$(window).scroll(function(){
		if($(document).scrollTop() > 50){
			$("#header").removeClass('header-up').addClass('header-down');
			$("#nav div").removeClass('headerItem-up').addClass('headerItem-down');
			$("#login div").removeClass('headerItem-up').addClass('headerItem-down');
		}else{
			$("#header").removeClass('header-down').addClass('header-up');
			$("#nav div").removeClass('headerItem-down').addClass('headerItem-up');
			$("#login div").removeClass('headerItem-down').addClass('headerItem-up');
		}
	});


	function movepage(obj) {
		var page = $(obj).html();
		if(page == 'MAP'){
			
			window.open("http://map.naver.com/?pinId=11556053&pinType=site&dlevel=12&y=ddda0d9b40f896e92281feedb52d61e5&x=b93d45d0ea3bf35a4fe3f902140e0e0c&enc=b64","_blank");
			return;
		}
		
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