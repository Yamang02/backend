<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<%
/* 
            	sendRedirect(String url)
            	- 매개값으로 지정한 url로 요청을 재전송한다.
            	- 리다이렉트 방식은 현재 페이지의 요청 정보와 응답 정보가 유지되지 않는다.
*/

    response.sendRedirect("redirect_target.jsp");
%>