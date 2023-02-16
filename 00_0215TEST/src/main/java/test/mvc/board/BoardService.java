package test.mvc.board;

import static test.mvc.common.jdbc.JDBCTemplate.close;
import static test.mvc.common.jdbc.JDBCTemplate.commit;
import static test.mvc.common.jdbc.JDBCTemplate.getConnection;
import static test.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

public class BoardService {

	public int insertBoard(Board board) {
		
		System.out.println("BS_insertBoard 실행");
		
		int result = 0;
		Connection connection = getConnection();

		result = new BoardDao().insertBoard(connection, board);

		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);
		return result;

	}

}
