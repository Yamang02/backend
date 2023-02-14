package com.kh.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.util.PageInfo;

@WebServlet(name = "boardList", urlPatterns = { "/board/list" })
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardListServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Board> list = null;

		// 예외처리를 활용해 null값이나 숫자값이 아닌 다른 것이 들어왔을 때 1페이지로 연결될 수 있도록 함.
		try {
			page = Integer.parseInt(request.getParameter("page"));

		} catch (NumberFormatException e) {
			page = 1;
		}

		listCount = new BoardService().getBoardCount();
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = new BoardService().getBoardList(pageInfo);

		System.out.println(list);

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/board/list.jsp").forward(request, response);

	}

}
