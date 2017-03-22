<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	a, a:VISITED{
		color:blue;
		text-decoration: none;
	}
</style>
<!-- <script src="WEB-INF/lib/webjars/jquery/1.12.4/dist/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function(){
		
		$("select[name='rowNum']").change(function() {
			var rowNum = $(this).val();
			var boardNo = ${boardNo};
			var page = ${page};
			location.replace("articleList.do?boardNo="+boardNo+"&rowNum="+rowNum+"&page="+page);	
		});
		
		
		$("select[name='category']").change(function(){
			var category = $(this).val();			
			var boardNo = ${boardNo};
			var page = ${page};
			var rowNum = ${rowNum};
			location.replace("articleList.do?boardNo="+boardNo+"&rowNum="+rowNum+"&page="+page+"&category="+category);
		});
	});
	
	
	function pageMove(boardNo, page, rowNum){
		var category = "${category}";
		
		if(category == null || category == "카테고리" || category == "전체"){
			location.replace("articleList.do?boardNo="+boardNo+"&rowNum="+rowNum+"&page="+page);
		}else{
			location.replace("articleList.do?boardNo="+boardNo+"&rowNum="+rowNum+"&page="+page+"&category="+category);
		}
	}
	
</script>
<title>Insert title here</title>
</head>
<body>
	<p>
		<select name="category" id="category">
			<option>카테고리</option>
			<option>전체</option>
			<option value="공지사항">공지사항</option>
			<option value="잡담">잡담</option>
			<option value="질문">질문</option>
		</select>
		
		<select name="rowNum">
			<option>출력개수</option>
			<option value="5">5개씩 보기</option>
			<option value="10">10개씩 보기</option>
			<option value="15">15개씩 보기</option>
			<option value="20">20개씩 보기</option>
			<option value="30">30개씩 보기</option>
		</select>
	</p>
	
	<table>
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>
		
		
		
		<c:if test="${articleList.size() == 0}">
			<tr>
				<td colspan="6">게시물이 없습니다.</td>
			</tr>
		</c:if>

		
		<c:forEach var="article" items="${articleList}">
				<tr>
					<td>${article.articleNo}</td>
					<td>${article.category}</td>
					<td><a href="article.do?boardNo=${boardNo}&articleNo=${articleNo}">${article.title}</a></td>
					<td><a href="">${article.name}(${article.id})</a></td>
					<td>${article.writeTime}</td>
					<td>${article.hits}</td>
					<td>${article.recommend}</td>					
				</tr>
		</c:forEach>
		
		
		
		
		
	</table>
	<p>
		<c:if test="${articleList.size() == 0}">
			<h4>게시물이 없습니다.</h4>
		</c:if>
		
		<c:if test="${startPage >= 10}">
			<a href="javascript:void(0);" onclick="pageMove(${boardNo}, ${page-10}, ${rowNum});">[이전]</a>
		</c:if>
		
		<c:forEach begin="${startPage}" end="${endPage}" var="page">
			<a href="javascript:void(0);" onclick="pageMove(${boardNo}, ${page}, ${rowNum});">[${page}]</a>
		</c:forEach>
			
		<c:if test="${endPage < totalPage}">
			<a href="javascript:void(0);" onclick="pageMove(${boardNo}, ${startPage+10}, ${rowNum});">[다음]</a>
			<a href="articleList.do?boardNo=${boardNo}&page=${startPage+10}&rowNum=${rowNum}">[다음]</a>
		</c:if>
	</p>
	
	
	
	
	
	<p>
		<select name="searchby">
			<option val="all">전체</option>
			<option val="title">제목</option>
			<option val="titlecontent">제목+내용</option>
			<option val="content">내용</option>
			<option val="name">작성자</option>
		</select>
		<input type="search" name="search">
		<input type="button" value="검색">
	</p>
</body>
</html>