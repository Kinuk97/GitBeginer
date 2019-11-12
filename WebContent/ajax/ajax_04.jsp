<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/httpRequest.js"></script>
<script type="text/javascript">
function helloToServer() {
	var method = "GET";
	var url = "./ajax_04_ok.jsp";
	var params = "name=" + f.name.value + "&content=" + f.content.value;
	
	// id를 주면 window에 등록된다.
	// id를 주지않으면 name으로 찾는 방법
// 	console.log(window.f.name.value);
// 	console.log(window.f.content.value);
	
	
	sendRequest(method, url, params, fromServer);
}

function fromServer() {
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
// 			// div 태그 생성
// 			var div = document.createElement("div");
			
// 			// 응답 text div 안에 넣기
// 			div.innerHTML = httpRequest.responseText;
			
// 			// name f인 form 안에 넣어주기
// 			document.f.appendChild(div);
			
			appendResult();
		}
	}
}

// 결과 <div>를 추가하는 함수
function appendResult() {
	// 방법 1.
	// div 태그 생성
// 	var div = document.createElement("div");
	
// 	// 응답 text div 안에 넣기
// 	div.innerHTML = httpRequest.responseText;
	
// 	// name f인 form 안에 넣어주기
// 	document.f.appendChild(div);
	
	// 방법 2.
// 	console.log(window);
// 	window.f.innerHTML += "<div>" + httpRequest.responseText + "</div>";

	// 방법 3. ok.jsp 수정 (응답 데이터에 div 만들어주기)
	// 미리 div 만들어두기
	window.result.innerHTML += httpRequest.responseText;
	
}
</script>
</head>
<body>
	<h1>Ajax 04</h1>
	<hr>
	<form action="" name="f">
		<fieldset>
			<legend>글쓰기</legend>
			<input type="text" name="name" placeholder="이름">
			<textarea rows="" cols="" name="content" placeholder="내용" style="vertical-align: middle;"></textarea>
		
			<button type="button" onclick="helloToServer();">입력</button>
		</fieldset>
	</form>
	<div id="result"></div>
</body>
</html>