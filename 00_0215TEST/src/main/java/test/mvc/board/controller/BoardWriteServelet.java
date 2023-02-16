package test.mvc.board.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.mvc.board.Board;
import test.mvc.board.BoardService;

@WebServlet(name = "boardWrite", urlPatterns = { "/boardInsert" })
public class BoardWriteServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardWriteServelet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("dopost 실행");
		Board board = new Board();

		String title = request.getParameter("boardTitle");
		String Writer = request.getParameter("boardWriter");
		String Content = request.getParameter("boardContent");
		
		System.out.println(title);
		System.out.println(Writer);
		System.out.println(Content);
		
		
		board.setBoardTitle(title);
		board.setBoardWriter(Writer);
		board.setBoardContent(Content);

		int result = new BoardService().insertBoard(board);

		if (result > 0) {
			request.setAttribute("message", "게시글 등록 성공");
			request.setAttribute("location", "/board/list");

		} else {
			request.setAttribute("message", "게시글 등록 실패");
			request.setAttribute("location", "/board/list");
		}

		request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
	}

}
