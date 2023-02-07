<%@page import="com.kh.el.model.vo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// Request 영역에 저장된 속성(Attribute)을 가져온다.
// String classRoom = (String) request.getAttribute("classRoom");
// Student student = (Student) request.getAttribute("student");

// Session 영역에 저장된 속성(Attribute)을 가져온다.
String classRoom = (String) session.getAttribute("classRoom");
Student student = (Student) session.getAttribute("student");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL</h1>

	<h2>1. 기본 방식으로 request, session 객체에 담겨있는 데이터를 추출</h2>
	강의장 :
	<%=classRoom%>
	수강생 :
	<%=student.getName()%>,
	<%=student.getAge()%>
	<br>

	<h2>2. EL 방식으로 request와 session 객체에 담겨있는 데이터를 출력</h2>

	<!-- 1.EL은 영역 객체에 저장된 속성명을 검색해서 존재하는 경우 값을 가져온다. 
		우선순위 1. Page 영역 > Request 영역 > Session 영역


	2. EL은 인스턴스의 필드에 직접 접근하는 것처럼 보이지만 내부적으로는 해당 인스턴스의 Getter 메소드로 접근해서 값을 읽어온다.

	 -->


	강의장 : ${ classRoom }
	<br>
	수강생 : ${ student.name }, ${ student.age }
	<br>

	<br>
	<br>

	강의장 : ${ sessionScope.classRoom }
	<br>
	수강생 : ${ sessionScope.student.name }, ${ sessionScope.student.age }

	<h2>3. EL 사용시 내장 객체에 저장된 속성명이 같은 경우</h2>
	<%
	pageContext.setAttribute("scope", "Page 영역");
	%>

	scope : ${ scope }
	<br>
	PageScope : ${ pageScope.scope }
	<br>
	requestScope : ${ requestScope.scope }
	<br>
	sessionScope : ${ sessionScope.scope }
	<br>
	applicationScope : ${ applicationScope.scope }

	<h2>4. ContextPath 가져오기</h2>
	<h3>1) 표현식 태그를 사용하는 방법</h3>
	ContextPath :
	<%=request.getContextPath()%>
	<br>


	<!--  	((HttpServletRequest)(pageContext.getRequest())).getContextPath(); -->
	<h3>2) EL을 사용하는 방법</h3>
	ContextPath : ${ pageContext.request.contextPath }


	<br>

	<h2>5. 헤더에 접근하기</h2>
	<h3>1) 표현식 태그를 사용하는 방법</h3>
	Host :
	<%=request.getHeader("Host")%>
	<br>
	User-Agent :
	<%=request.getHeader("User-Agent")%>

	<h3>2) EL을 사용하는 방법</h3>
	Host : ${ header.host }
	<br>
	User-Agent : ${ header['User-Agent'] }



</body>
</html>