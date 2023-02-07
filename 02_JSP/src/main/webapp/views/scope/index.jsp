<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>영역(Scope) 개체</h1>
	<h2>Session 영역과 Application 영역</h2>
	<%
	session.setAttribute("address", "경기도 광주시");
	/* 어떤 페이지든 브라우저가 종료되기 전까지 유지 */
	
	application.setAttribute("name", "문인수");
	/* 웹 애플리케이션이 종료되기 전까지 유지 */
	%>

	<a href="scopeTest1.jsp">View Details</a>

	<h2>Page 영역과 Request 영역의 비교</h2>

	<a href="scopeTest2.jsp">View Details</a>

</body>
</html>