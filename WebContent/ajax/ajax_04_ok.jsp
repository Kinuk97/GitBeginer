<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%-- name : ${param.name }<br> --%>
<%-- content : ${param.content }<br> --%>
<!-- <br> -->
<%-- ${param.name }님, 안녕하세요! --%>
<!-- <hr> -->
<div>
	name : ${param.name }<br>
	content : ${param.content }<br>
	<br>
	${param.name }님, 안녕하세요!
	<hr>
</div>