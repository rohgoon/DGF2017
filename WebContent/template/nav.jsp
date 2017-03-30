<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="headerItem DGF">DGF 2017</div>
<div class="headerItem" onclick="movepage(this);">HOME</div>
<div class="headerItem" onclick="movepage(this);">LINE-UP</div>
<div class="headerItem" onclick="movepage(this);">TICKETS</div>
<div class="headerItem" onclick="movepage(this);">COMMUNITY</div>
<c:if test="${auth.id == 'admin'}">
	<div class="headerItem" onclick="movepage(this);">MANAGER</div>
</c:if>
