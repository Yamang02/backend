package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/method.do", "/Method.do" })
public class MethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MethodServlet() {
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사용자가 보낸 데이터들은 request 객체 안에 키(name 속성의 값), 값(value 속성의 값) 형태로 담겨 있다.
		// request.getParameter("name 속성의 값") : 해당 name 속성의 값을 가지는 요소의 value 값을 문자열로
		// 읽어온다.

		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");
		String gender = request.getParameter("gender");
//			String food = request.getParameter("food");

		// 체크박스와 같이 하나의 name 속성에 여러 값이 존재하는 경우 getParameterValues("name 속성의 값") 메소드를
		// 사용한다.
		// 해당 name 속성을 가지는 요소들의 value값들을 문자열의 배열로 읽어온다.
		String[] foods = request.getParameterValues("food");

		System.out.println(userName);
		System.out.println(userAge);
		System.out.println(gender);
//		System.out.println(foods);
		Arrays.stream(foods).forEach(System.out::println);

		// 응답 화면 작성
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		out.println("<html>");
		out.println("<head>");
		out.println("<title>개인 정보 출력</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>개인 정보 출력</h2>");
		out.printf("%s님은 %s세이고 성별은 %s입니다.<br>", userName, userAge, gender);
		out.print("좋아하는 음식은 ");
		Arrays.stream(foods).forEach(food -> out.print(food + " "));
		out.print("입니다.");
		out.println("</body>");
		out.println("</html>");

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// POST 방식으로 넘겨받는 데이터가 영어 또는 숫자가 아닌 경우에 인코딩 처리를 해야한다.
		// request에서 파라미터 값을 가져오기 전에 UTF-8로 인코딩 설정을 한다.
		request.setCharacterEncoding("UTF-8");

		doGet(request, response);

	}

}
