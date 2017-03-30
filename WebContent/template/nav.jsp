<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<ul>
			<li>
				<a onclick="movepage(this);">HOME</a>
			</li>
			
			<li>
				<a onclick="movepage(this);">LINE-UP</a>
			</li>
			
			<li>
				<a onclick="movepage(this);">TICKETS</a>

			</li>
			<li>
				<a onclick="movepage(this);">COMMUNITY</a>
			</li>
			<c:if test="${auth.id == 'admin'}">
				<li>
					<a onclick="movepage(this);">MANAGER</a>
				</li>
			</c:if>
		</ul>