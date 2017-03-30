<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${empty auth}">
	<div class="headerItem" onclick="showLoginDialog();">LOG-IN</div>
</c:if>
<c:if test="${!empty auth}">
	<div class="headerItem" onclick="logOut();">LOG-OUT</div>
</c:if>

<c:if test="${empty auth}">
	<div class="headerItem" onclick="showJoinDialog();">JOIN-US</div>
</c:if>
<c:if test="${!empty auth}">
	<div class="headerItem" onclick="showMyInfoDialog();">MY-INFO</div>
</c:if>

