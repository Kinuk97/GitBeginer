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
		var n1 = $("#num1").val();
		var n2 = $("#num2").val();
		var op = $("#oper").val();
		
		// --- 전달 파라미터 ---
		// PlainObject
		var data = {
				"num1" : n1,
				"num2" : n2,
				"oper" : op
		};
		// String
		var query = "num1=" + n1 + "&num2=" + n2 + "&oper=" + op;
		// ------------------------
		
		// 요청 URL
		var url = "/jqAjax/jqAjax_ok.jsp";
		
// 		$.get(url);
		
		$.get(url, data, function(res) {
			$("#resultLayout").html(res);
		});
		$.post(url, data, function(res) {
			$("#resultLayout").html(res);
		});
		
	});
});

function complete(responseText, textStatus, jqXHR) {
	
}

</script>
</head>
<body>
<h1>jQuery 계산기 02</h1>
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