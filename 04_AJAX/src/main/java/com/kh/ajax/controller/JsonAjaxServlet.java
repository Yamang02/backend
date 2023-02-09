package com.kh.ajax.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.ajax.model.vo.User;

@WebServlet("/jsonAjax.do")
public class JsonAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JsonAjaxServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<User> list = new ArrayList<>();

		list.add(new User(1, "user1", 20, "남자"));
		list.add(new User(2, "user2", 16, "남자"));
		list.add(new User(3, "user3", 16, "여자"));
		list.add(new User(4, "user4", 20, "남자"));
		list.add(new User(5, "user5", 15, "여자"));
		list.add(new User(6, "user6", 15, "남자"));

		int userNo = Integer.parseInt(request.getParameter("userNo"));

		User findUser = list.stream().filter(user -> user.getNo() == userNo).findFirst().orElse(null);

		System.out.println(findUser);

		response.setContentType("application/json;charset=UTF-8");

//		response.getWriter().write("{\"no\": 1, \"name\": \"문인수\"}");
//		response.getWriter().printf("{\"no\": %d, \"name\": \"%s\"}", findUser.getNo(), findUser.getName());

		System.out.println(findUser);
//		System.out.println(new Gson().toJson(findUser));
//		System.out
//				.println(new Gson().fromJson("{\"no\":2,\"name\":\"user2\",\"age\":16,\"gender\":\"남자\"}", User.class));

//		new Gson().toJson(findUser, response.getWriter());
		response.getWriter().write(new Gson().toJson(findUser));

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<User> list = new ArrayList<>();

		list.add(new User(1, "user1", 20, "남자"));
		list.add(new User(2, "user2", 16, "남자"));
		list.add(new User(3, "user3", 16, "여자"));
		list.add(new User(4, "user4", 20, "남자"));
		list.add(new User(5, "user5", 15, "여자"));
		list.add(new User(6, "user6", 15, "남자"));

		String gender = request.getParameter("gender");

		List<User> findUsers = list.stream().filter(user -> user.getGender().equals(gender))
				.collect(Collectors.toList());

		System.out.println(findUsers);
		System.out.println(new Gson().toJson(findUsers));

		response.setContentType("application/json;charset=UTF-8");
		new Gson().toJson(findUsers, response.getWriter());
	}

}
