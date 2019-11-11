<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

</head>
<body>

<c:set var="n1" value="${param.num1 }"/>
<c:set var="n2" value="${param.num2 }"/>
<c:set var="op" value="${param.oper }"/>

<c:choose>
	<c:when test="${op eq 'add' }">
		${n1 } + ${n2 } = ${n1 + n2 }<br>
	</c:when>
	<c:when test="${op eq 'sub' }">
		${n1 } - ${n2 } = ${n1 - n2 }<br>
	</c:when>
	<c:when test="${op eq 'mul' }">
		${n1 } * ${n2 } = ${n1 * n2 }<br>
	</c:when>
	<c:when test="${op eq 'div' }">
		${n1 } / ${n2 } = <fmt:formatNumber value="${n1 / n2 }" pattern="0.00"></fmt:formatNumber><br>
	</c:when>
	
	
</c:choose>
<h1><a href="./ajax_01.jsp">입력 폼으로</a></h1>
<h1><a onclick="history.go(-1);">뒤로 가기</a></h1>
</body>
</html>