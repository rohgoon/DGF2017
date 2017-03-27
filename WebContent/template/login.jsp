<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<c:if test="${empty auth}">
	<a onclick="showLoginDialog();">LOG-IN</a>
</c:if>
<c:if test="${!empty auth}">
	<a onclick="logOut();">LOG-OUT</a>
</c:if>

<a onclick="showJoinDialog();">JOIN-US</a>