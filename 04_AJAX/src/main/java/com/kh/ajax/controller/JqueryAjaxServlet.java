package com.kh.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

@WebServlet("/jqAjax1.do")
public class JqueryAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JqueryAjaxServlet() {
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String input = request.getParameter("input");

		System.out.println("입력 값 : " + input);

//		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().printf("입력 값 : %s, 길이 : %d", input, input.length());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String age = request.getParameter("age");

//		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(name + " , " + age);
		
	}

}
