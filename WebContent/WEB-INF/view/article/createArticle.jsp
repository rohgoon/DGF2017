<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="articleContent">
	<div id="aInfo">
		<p> 
			<input type="text" name="title" placeholder="제목을 입력하세요">
			<span>
				<label class="lblRow">카테고리</label> 
				<select name="category">
					<option value="공지사항">공지사항</option>
					<option value="잡담">잡담</option>
			 		<option value="질문">질문</option>
				</select>
			</span>
		</p>
		
		<p>
			<span>글쓴이 : ${auth.uname}(${auth.id})</span>
		</p>
	</div>

	<p><textarea rows="30" cols="100" name="content"></textarea></p>
	<p><input type="file" name="attachedFile" style="text-align: left;"></p>

	<p>
		<input type="button" value="목록" class="raBtn" onclick="loadBoard(${boardNo})">
		<input type="button" value="글쓰기" class="raBtn" onclick="writeArticle(${boardNo})">
	</p>

</div>

