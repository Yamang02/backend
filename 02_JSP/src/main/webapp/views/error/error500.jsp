<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" % isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>에러가 발생했습니다. 잠시후 다시 시도해 주세요.</h1>

	<button onclick="history.go(-1);">이전 페이지로</button>

	<%=exception%>
	<%=exception.getMessage()%>


</body>
</html>