<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#btnCalc").on("click", function() {
// 		console.log("btn Clicked");

		var n1 = $("#num1").val();
		var n2 = $("#num2").val();
		var op = $("#oper").val();
		
// 		console.log(n1 + ", " + n2 + ", " + op);
		
		// --- 전달 파라미터 ---
		// PlainObject
		var data = {
				"num1" : n1,
				"num2" : n2,
				"oper" : op
		};
		
		// String
		var query = "num1=" + n1 + "&num2=" + n2 + "&oper=" + op;
		
// 		console.log(data);
// 		console.log(query);

		// ------------------------
		
		// 요청 URL
		var url = "/jqAjax/jqAjax_ok.jsp";
		
		// .load()를 이용한 Ajax요청
		$("#resultLayout").load(url, data, complete); // POST 전송
		
// 		$("#resultLayout").load(url, data); // GET 전송
		
		
// 		$("#resultLayout").load("/jqAjax/jqAjax_ok.jsp", {
// 			"num1" : $("#num1").val(),
// 			"num2" : $("#num2").val(),
// 			"oper" : $("#oper").val()
// 		});
	});
});

function complete(responseText, textStatus, jqXHR) {
	console.log("AJAX 요청이 잘 이루어짐");
	
	console.log("리스폰스텍스트");
	console.log(responseText);
	console.log("텍스트스테이터스");
	console.log(textStatus);
	console.log("jqXHR");
	console.log(jqXHR);
	
}

</script>
</head>
<body>
<h1>jQuery 계산기 01</h1>
	<hr>
	<input type="text" id="num1">
	<select id="oper" style="vertical-align: middle;">
		<option value="add">더하기</option>
		<option value="sub">빼기</option>
		<option value="mul">곱하기</option>
		<option value="div">나누기</option>
	</select>
	<input type="text" id="num2">
	<button id="btnCalc"> = </button>
	<hr>
	<div id="resultLayout"></div>
</body>
</html>