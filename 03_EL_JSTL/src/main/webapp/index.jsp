<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL / JSTL</title>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
	<h1>EL / JSTL</h1>
	<h2>1. EL(Expression Language)</h2>

	<p>
		EL은 JSP 2.0 버전에서 추가된 표현 언어이다.
		<br>
		표현식 태그를 대신하여 클라이언트에 출력하고자 하는 값들을 좀 더 간결하게 사용하는 방법이다.

	</p>

	<h3>1) EL</h3>

	<a href="el.do">View Details</a>

	<h3>2) EL 파라미터</h3>
	<!-- 	<form action="/03_EL_JSTL/views/el/elParam.jsp" method="GET"> -->
	<!-- 하드코딩보다는 contextpath를 이용하여 하는 것이 좋음(바뀔 수도 있기 때문에)   -->
	<form action="${ pageContext.request.contextPath }/views/el/elParam.jsp" method="GET">
		<fieldset>
			<legend>제품 입력</legend>
			<input type="text" name="pName" placeholder="제품명을 입력하세요.">
			<br>
			<input type="number" name="pCount" placeholder="수량을 입력하세요.">
			<br>
			<input type="text" name="option" placeholder="옵션을 입력하세요.">
			<br>
			<input type="text" name="option" placeholder="옵션을 입력하세요.">
			<br>
			<br>
			<input type="submit" value="전송">
		</fieldset>


	</form>

	<h3>3) EL 연산자</h3>
	<a href="views/el/elOperators.jsp">View Details</a>

	<h2>Jsp Action Tag</h2>
	<p>
		JSP 페이지에서 자바 코드를 직접 입력하지 않고 특정 작업을 수행하는데 사용하는 태그이다.
		<br>
		액션 태그의 경우 웹 브라우저에서 실행되는 것이 아니라 웹 컨테이너에서 실행된다
	</p>

	<h3>1) 표준 액션 태그</h3>
	<p>JSP에서 기본으로 제공하는 액션 태그로 별도의 라이브러리 설치 없이 바로 사용할 수 있다.</p>

	<a href="${ contextPath }/views/actiontag/standard/include.jsp">jsp:include</a>
	<a href="${ contextPath }/views/actiontag/standard/forward.jsp">jsp:forward</a>

	<h3>2) JSTL(JSP Standard Tag Library)</h3>
	<p>
		JSP Standard Tag Library의 약자로 JSP에서 사용하는 커스텀 태그이다.
		<br>
		JSP 페이지에서 자주 사용하는 코드들을 사용하기 쉽게 태그로 만들어 표준으로 제공한다.
	</p>

	<h4>2-1) JSTL Core Library</h4>

	<p>변수와 url, 조건문, 반복문 등의 로직과 관련된 JSTL 문법(액션 태그) 제공</p>
	<a href="${ contextPath }/views/actiontag/jstl/core.jsp">JSTL Core</a>

</body>

</html>