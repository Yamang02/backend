package com.kh.mvc.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.common.util.FileRename;
import com.kh.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

@WebServlet(name = "boardUpdate", urlPatterns = { "/board/update" })
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardUpdateServlet() {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// int no = Integer.parseInt(request.getParameter("no"));
		// no값 읽어오기 -> 형변환
		// alt shift i 로 인라인

		HttpSession session = request.getSession(false);
		Member loginMember = session == null ? null : (Member) session.getAttribute("loginMember");

		if (loginMember != null) {
			Board board = new BoardService().getBoardByNo(Integer.parseInt(request.getParameter("no")), true);

			if (board != null && loginMember.getId().equals(board.getWriterId())) {
				request.setAttribute("board", board);
				request.getRequestDispatcher("/views/board/update.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "잘못된 접근입니다.");
				request.setAttribute("location", "/board/list");
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			}

		} else {
			request.setAttribute("msg", "로그인 후 사용이 가능합니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member loginMember = session == null ? null : (Member) session.getAttribute("loginMember");

		if (loginMember != null) {
			String path = getServletContext().getRealPath("/resources/upload/board");
			// 파일이 저장될 경로를 얻어옴
			System.out.println(path);

			// 파일의 최대 사이즈 지정 (10MB)
			int maxSize = 10485760;

			// 파일 인코딩 설정
			String encoding = "UTF-8";

			MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());

			Board board = new BoardService().getBoardByNo(Integer.parseInt(mr.getParameter("no")), true);

			if (board != null && loginMember.getId().equals(board.getWriterId())) {
				board.setTitle(mr.getParameter("title"));
				board.setContent(mr.getParameter("content"));

				// 사용자의 파일 업로드 여부를 체크
				String originalFileName = mr.getOriginalFileName("upfile");
				String filesystemName = mr.getFilesystemName("upfile");

				if (originalFileName != null && filesystemName != null) {
					// 기존에 업로드된 파일 삭제
					File file = new File(path + "/" + board.getRenamedFileName());

					if (file.exists()) {
						file.delete();
					}

					board.setOriginalFileName(originalFileName);
					board.setRenamedFileName(filesystemName);
				}

				int result = new BoardService().save(board);

				if (result > 0) {
					request.setAttribute("msg", "게시글 수정 성공");
					request.setAttribute("location", "/board/view?no=" + board.getNo());
				} else {
					request.setAttribute("msg", "게시글 수정 실패");
					request.setAttribute("location", "/board/update?no=" + board.getNo());
				}

			} else {
				request.setAttribute("msg", "잘못된 접근입니다.");
				request.setAttribute("location", "/board/list");
				// request.getRequestDispatcher("/views/common/msg.jsp").forward(request,
				// response);
			}

		} else {
			request.setAttribute("msg", "로그인 후 사용이 가능합니다.");
			request.setAttribute("location", "/");
		}
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}