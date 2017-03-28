<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="loginBox">
	
	<c:if test="${empty auth}">
		<p><input type="text" id="login_id" placeholder="ID"></p>
	</c:if>
		<p><input type="password" id="login_pw" placeholder="PASSWORD"></p>
		<p><input type="button" onclick="login()" value="Login"></p>	
		<p>아직 회원이 아니세요? <a href="#" onclick="goJoin()">가입하기</a></p>	
		<p><a href="#" onclick="notLogin()">비회원으로 계속보기</a></p>
</div>
