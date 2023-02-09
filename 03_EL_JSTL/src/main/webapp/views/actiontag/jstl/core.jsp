<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.el.model.vo.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Library</title>
</head>
<body>
	<h1>JSTL Core Library</h1>

	<h2>1. 변수</h2>

	<h3>1) 변수 선언</h3>
	<p>변수를 선언하고 초기값을 대입하는 태그이다.</p>


	<%--	
	 pageContext.setAttribute("num1", "10");
	 --%>

	<c:set var="num1" value="30" />
	<c:set var="num2" value="20" scope="request" />
	<c:set var="result" value="${num1 + num2}" scope="session" />
	<c:set var="array" scope="application">red, blue, yellow, pink, green</c:set>

	num1 변수의 값 : ${ num1 }
	<br>
	num2 변수의 값 : ${ num2 } 또는 ${ requestScope.num2 } 또는
	<%=request.getAttribute("num2")%>
	<br>
	result 변수의 값 : ${ result } 또는 ${ sessionScope.result }
	<br>
	array 배열의 값 : ${ array }
	<br>

	<h3>2) 변수 삭제</h3>
	<p>c:set 태그로 선언한 변수를 삭제할 때 사용하는 태그이다.</p>

	<c:set var="result" value="99999" />
	<c:set var="result" value="10000" scope="request" />
	<br>

	삭제 전 : ${ result }

	<c:remove var="result" scope="page" />
	<br>

	삭제 후 : ${ result }

	<c:remove var="result" />
	<br>

	삭제 후 : ${ result }

	<h2>2. 출력</h2>
	<p>클라이언트로 데이터를 출력할 때 사용하는 태그이다.</p>

	<c:out value="<b>태그로 출력하기</b>" />
	<br>
	<c:out value="<b>태그로 출력하기</b>" escapeXml="false" />
	<br>

	<c:out value="${ result }" default="값이 없음" />
	<br>

	<h2>3. 조건문</h2>
	<h3>1) c:if 태그</h3>
	<p>
		자바의 if 구문과 같은 역할을 하는 태그이다.
		<br>
		조건식은 test 속성에 EL 구문으로 기술해야 한다.
	</p>

	<c:if test="${ num1 > num2 }">
		<b>num1이 num2보다 크다.</b>

	</c:if>
	<c:if test="${ num1 < num2 }">
		<b>num1이 num2보다 작다.</b>

	</c:if>

	<h3>2) c:choose 태그</h3>

	<p>자바의 switch 구문과 같은 역할을 하는 태그이다. 하위 태그인 c:when, c:otherwise 태그와 함께 사용되는데, 각각 switch 구문의 case, default 절과 비슷한 역할을 한다</p>

	<c:choose>
		<c:when test="${ num1 > num2 }">
			<b>num1이 num2보다 크다.</b>
		</c:when>

		<c:when test="${ num1 < num2 }">
			<b>num1이 num2보다 작다.</b>
		</c:when>

		<c:otherwise>
			<b>num1이 num2과 같다.</b>
		</c:otherwise>
	</c:choose>

	<h2>4. 반복문</h2>
	<h3>1) c:forEach 태그</h3>

	<p>자바의 for 구문에 해당하는 역할을 하는 태그이다.</p>

	<c:forEach var="i" begin="1" end="8" step="2">
		<%--
			${ i }<br>
		 --%>
		<%-- 태그 안에도 EL 적용 가능--%>
		<%-- 		<h${ i }> 반복 확인 : ${ i } </h${ i }> --%>
	</c:forEach>

	<h4>자바의 향상된 for 구문처럼 사용하기</h4>
	<c:forEach var="color" items="${ array }">
		<span style="color: ${ color };"> 배열 확인 : ${ color } </span>
		<br>

	</c:forEach>

	<%
	List<Student> list = new ArrayList<>();

	list.add(new Student("문인수", 19, 80, 80));
	list.add(new Student("홍길동", 30, 70, 90));
	list.add(new Student("이몽룡", 29, 70, 70));
	list.add(new Student("김철수", 16, 100, 100));

	pageContext.setAttribute("list", list);
	%>

	<h5>학생 목록 조회</h5>
	<table border="1">
		<tr>
			<th>인덱스</th>
			<th>순번</th>
			<th>이름</th>
			<th>나이</th>
			<th>수학 점수</th>
			<th>영어 점수</th>
			<th>First</th>
			<th>Last</th>
		</tr>
		<c:forEach var="student" items="${ list }" varStatus="status">
			<tr>
				<td>${ status.index }</td>
				<td>${ status.count }</td>
				<td>${ student.name }</td>
				<td>${ student.age }</td>
				<td>${ student.math }</td>
				<td>${ student.english }</td>
				<td>${ status.first }</td>
				<td>${ status.last }</td>
			</tr>

		</c:forEach>

	</table>

	<h3>2) c:forTokens 태그</h3>
	<p>문자열에 포함된 구분자를 통해 토큰을 분리해 반복을 수행하는 태그</p>

	<ul>
		<c:forTokens var="color" items="pink red tomato lime yellowgreen aqua" delims=" ">
			<li style="color : ${color}">${ color }</li>
		</c:forTokens>
	</ul>

	<h2>5. c:url 태그</h2>
	<p>URL을 생성하고 쿼리 스트링을 미리 설정하는 태그이다.</p>

	<c:url var="url" value="/views/el/elParam.jsp">

		<c:param name="pName" value="아이폰 12 미니" />
		<c:param name="pCount" value="2" />
		<c:param name="option" value="화이트" />
		<c:param name="option" value="128GB" />


	</c:url>
	<a href="${url}">이동</a>


</body>
</html>