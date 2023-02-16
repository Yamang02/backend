package com.kh.mvc.board.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.mvc.common.jdbc.JDBCTemplate.commit;
import static com.kh.mvc.common.jdbc.JDBCTemplate.rollback;
import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.board.model.dao.BoardDao;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.board.model.vo.Reply;
import com.kh.mvc.common.jdbc.JDBCTemplate;
import com.kh.mvc.common.util.PageInfo;

public class BoardService {

	public int getBoardCount() {
		int count = 0;
		Connection connection = getConnection();

		count = new BoardDao().getBoardCount(connection);

		close(connection);
		return count;
	}

	public List<Board> getBoardList(PageInfo pageInfo) {
		List<Board> boardlist = null;
		Connection connection = getConnection();

		boardlist = new BoardDao().findAll(connection, pageInfo);

		close(connection);

		return boardlist;
	}

	public Board getBoardByNo(int no, boolean hasRead) {
		Board board = null;
		Connection connection = getConnection();

		board = new BoardDao().findBoardByNo(connection, no);

		// 게시글 조회수 증가 로직
		if (board != null && !hasRead) {

			int result = new BoardDao().updateReadCount(connection, board);

			if (result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		}
		close(connection);
		return board;
	}

	public int save(Board board) {

		int result = 0;
		Connection connection = getConnection();

		if (board.getNo() > 0) {
			// update 작업
			result = new BoardDao().updateBoard(connection, board);
		} else {
			// insert 작업
			result = new BoardDao().insertBoard(connection, board);
		}

		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}

		close(connection);
		return result;
	}

	public int delete(int no) {
		int result = 0;
		Connection connection = getConnection();

		result = new BoardDao().updateStatus(connection, no, "N");

		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}

		close(connection);
		return result;
	}

	public int saveReply(Reply reply) {
		int result = 0;
		Connection connection = getConnection();

		result = new BoardDao().insertReply(connection, reply);

		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}

		close(connection);

		return result;
	}

}
