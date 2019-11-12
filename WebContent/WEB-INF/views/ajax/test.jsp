<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/httpRequest.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var btnAction = document.getElementById("btnAction");
		btnAction.addEventListener("click", function(e) {
			sendRequest("POST", "/ajax/test", "", callback);
		});
	}
	
function callback() {
	console.log(httpRequest.readyState);
	if (httpRequest.readyState == 4) { // XHR DONE.
		if (httpRequest.status == 200) { // HTTP OK
			printData();
		}
	}
}

function printData() {
	var res = document.getElementById("result");
	
	var jsonText = httpRequest.responseText; // 응답 데이터 받기
	
	var jsonObject = JSON.parse(jsonText); // 응답 데이터 JSON 파싱, 언마샬링
	
// 	console.log(jsonObject[0].id);
	
	for (var i = 0; i < jsonObject.length; i++) {
		res.innerHTML += jsonObject[i].id + " : " + jsonObject[i].pw + "<br>";
	}
	
// 	console.log(jsonObject);
// 	console.log(jsonObject.data);
// 	console.log(jsonObject.id);
// 	console.log(jsonObject.pw);

	
}
</script>
</head>
<body>
	<h1>AJAX 테스트</h1>
	<hr>
	<button id="btnAction">AJAX 요청</button>
	<div id="result"></div>
</body>
</html>