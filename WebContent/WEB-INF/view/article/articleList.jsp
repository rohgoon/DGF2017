<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="article">
		<p class="tRow">
			<select name="category" id="category">
				<option>카테고리</option>
				<option>전체</option>
				<option value="공지사항">공지사항</option>
				<option value="잡담">잡담</option>
				<option value="질문">질문</option>
			</select> <select name="rowNum">
				<option>출력개수</option>
				<option value="5">5개씩 보기</option>
				<option value="10">10개씩 보기</option>
				<option value="15">15개씩 보기</option>
				<option value="20">20개씩 보기</option>
				<option value="30">30개씩 보기</option>
			</select>
		</p>

	
		<p class="tRow">
			<span class="tHeader tNo">번호</span>
			<span class="tHeader tCategory">카테고리</span>
			<span class="tHeader tTitle" id="articleTitle">제목</span>
			<span class="tHeader tWriter">작성자</span>
			<span class="tHeader tTime">작성시간</span>
			<span class="tHeader tHit">조회수</span>
			<span class="tHeader tRec">추천수</span>
		</p>



		<c:if test="${articleList.size() == 0}">
			<p>
				<h2 colspan="6">게시물이 없습니다.</h2>
			</p>
		</c:if>


		<c:forEach var="article" items="${articleList}">
			<p class="tRow">
				<span class="tData tNo">${article.articleNo}</span>
				<span class="tData tCategory">${article.category}</span>
				<span class="tData tTitle"><a class="articleBtn" onclick="showArticle(${boardNo}, ${article.articleNo});">${article.title}</a></span>
				<span class="tData tWriter">${article.name}(${article.id})</span>
				<span class="tData tTime">${article.writeTime}</span>
				<span class="tData tHit">${article.hits}</span>
				<span class="tData tRec">${article.recommend}</span>
			</p>
		</c:forEach>
	

	<p class="tRow cRow">
		<c:if test="${startPage >= 10}">
			<a href="javascript:void(0);"
				onclick="pageMove(${boardNo}, ${page-10}, ${rowNum});">[이전]</a>
		</c:if>

		<c:forEach begin="${startPage}" end="${endPage}" var="page">
			<a href="javascript:void(0);"
				onclick="pageMove(${boardNo}, ${page}, ${rowNum});">[${page}]</a>
		</c:forEach>

		<c:if test="${endPage < totalPage}">
			<a href="javascript:void(0);"
				onclick="pageMove(${boardNo}, ${startPage+10}, ${rowNum});">[다음]</a>
			<a
				href="articleList.do?boardNo=${boardNo}&page=${startPage+10}&rowNum=${rowNum}">[다음]</a>
		</c:if>
	</p>




	<p class="tRow cRow">
		<select name="searchby">
			<option val="all">전체</option>
			<option val="title">제목</option>
			<option val="titlecontent">제목+내용</option>
			<option val="content">내용</option>
			<option val="name">작성자</option>
		</select> <input type="search" name="search"> <input type="button"
			value="검색"> <input type="button" value="글쓰기"
			onclick="createArticle(${boardNo});">
	</p>
</div>
<script>
$(function(){
	
	$("select[name='rowNum']").change(function() {
		var rowNum = $(this).val();
		var boardNo = ${boardNo};
		var page = ${page} + 0;
		
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
		});
	});
	
	
	$("select[name='category']").change(function(){
		var category = $(this).val();			
		var boardNo = ${boardNo};
		var page = ${page} + 0;
		var rowNum = ${rowNum} + 0;
		
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
	
	});
});


function pageMove(boardNo, page, rowNum){
	var category = "${category}";
	
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

</script>