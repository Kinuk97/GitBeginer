<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var json = {
			"a" : 1,
			"b" : 2,
			"c" : "Cherry",
			d : true,
			"e" : ["1", "2", 3]
	};
	
// 	console.log(json);
	
// 	console.log(json.d);
// 	console.log(json.e);

	var jsonText = JSON.stringify(json);
	console.log(jsonText);
	
	console.log("----------------");
	var jsonObject = JSON.parse(jsonText);
	console.log(jsonObject);
	
</script>
</head>
<body>

</body>
</html>