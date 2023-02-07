<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jsp:forward 액션 태그</h2>
	<p>forward 액션 태그는 다른 페이지로 요청을 전달할 때 사용하는 액션 태그이다.</p>

	<script>
		alert("안녕하세요.")
	</script>

	<%
	request.setAttribute("userName", "문인수");
	request.setAttribute("userAge", "20");
	%>

	<!-- forward 전에 응답 객체에 쓴 내용은 포워드되며 아무런 효과가 없다. -->
	<%-- 	<jsp:forward page="forwardPage.jsp" /> --%>

</body>
</html>