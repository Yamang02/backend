<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>주문 내역</h1>
	<p>
		param : 전달된 파라미터 값을 받아올 때 사용하는 내장 객체이다.
		<br>
		paramValues : 전달된 다수의 파라미터 값을 배열로 받아올 때 사용하는 내장 객체이다.
	</p>



	상품명 : ${ param.pName }
	<br>
	수량 : ${ param.pCount }
	<br>
	옵션1 : ${ paramValues.option[0] }
	<br>
	옵션2 : ${ paramValues.option[1] }
	<br>


</body>
</html>