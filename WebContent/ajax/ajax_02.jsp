<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("[name~='num1']").focus();
});

var xmlHttp = null; // AJAX 객체

function send() {
	xmlHttp = createXMLHttpRequest();
// 	console.log(xmlHttp);

	// 입력 데이터(정송 데이터) 구하기
	var n1 = document.getElementById("num1").value;
	var n2 = window.num2.value;
	var op = oper.value;
	
// 	console.log("n1 : " + n1);
// 	console.log("n2 : " + n2);
// 	console.log("op : " + op);
	
	// --- AJAX 요청 전 설정 ---
	// 요청 URL
	var query = "num1=" + n1 + "&num2=" + n2 + "&oper=" + op;
	var url = "/ajax/ajax_02_ok.jsp" + "?" + query;
// 	console.log(url);
	
	// 요청 Method
	var method = "GET";
	
	// AJAX 객체의 상태 변화에 따라 호출될 callback 함수 지정
	// -> 서버로부터의 응답 데이터를 처리하는 데 사용한다.
	// 이벤트 함수
	xmlHttp.onreadystatechange = callback;
	// ------------------------
	
	// --- 요청 준비 ---
	xmlHttp.open(method, url);
	// -----------------
	
	// --- 요청 보내기 ---
	xmlHttp.send(null);
	// -------------------
}

function callback() {
// 	console.log("XHR 동작");
// 	console.log(xmlHttp.readyState);
	
	if (xmlHttp.readyState == 4) { // XHR DONE.
		if (xmlHttp.status == 200) { // OK.
			console.log("정상 응답");
		
		// 정상 응답일 때 데이터를 출력하는 함수
		printDate();
		} else if (xmlHttp.status == 404) { // NOT FOUND.
			console.log("페이지 없음");
		} else if (xmlHttp.status == 500) { // Server Internal Error.
			console.log("서버 에러");
		} else {
			// 200 또는 404 또는 500이 아닐 경우
			console.log(xmlHttp.statusText);
		}
	}
}

// 응답 데이터 처리 함수
function printDate() {
// 	console.log("200 상태코드를 가진 정상 응답 시 호출");

	// 응답 데이터 text로 가져오기
	var result = xmlHttp.responseText;
	console.log(result);
	
	// 결과를 반영할 div
	var layout = resultLayout;
	layout.innerHTML = result;
}


// AJAX 객체(XHR)을 생성하는 함수
function createXMLHttpRequest() {
	var xmlReq = null;
	
	// XMLHttpRequest가 존재한다면 -- Cross Browsing 처리
	if (window.XMLHttpRequest) {
			// IE 7.0 이상일 때
			// IE 브라우저가 아닐 때
			xmlReq = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		// AcitiveXObject가 존재하는 브라우저일 때
		// -> IE계열 브라우저
		
		try {
			// 비교적 최근 버전
			xmlReq = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e1) {
			console.log(e1);
			try {
				// 비교적 예전 버전
				xmlReq = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) {
				console.log(e2);
				// XHR이 없는 경우 아무것도 수행하지 않는다.
			}
		}
	}
	
	return xmlReq;
}
</script>
</head>
<body>
	<h1>계산기 02</h1>
	<hr>
	<input type="text" id="num1">
	<select id="oper" style="vertical-align: middle;">
		<option value="add">더하기</option>
		<option value="sub">빼기</option>
		<option value="mul">곱하기</option>
		<option value="div">나누기</option>
	</select>
	<input type="text" id="num2">
	<input type="button" value=" = " onclick="send();">
	<hr>
	<div id="resultLayout"></div>
</body>
</html>