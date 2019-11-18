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
		$.ajax({
			type : "GET",
			url : "/jqAjax/jqAjax_ok.jsp",
			data : {
				"num1" : $("#num1").val(),
				"num2" : $("#num2").val(),
				"oper" : $("#oper").val()
			},
			dataType : "html",
			success : function(data) {
				console.log("성공");
				console.log(data);
				
				$("#resultLayout").html(data);
			},
			error : function(e) {
				console.log(e);
			}
		});
	});
});
</script>
</head>
<body>
<h1>jQuery 계산기 03</h1>
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