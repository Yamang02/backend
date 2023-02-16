package test.mvc.board;

import static test.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BoardDao {

	public int insertBoard(Connection conn, Board board) {

		System.out.println("Bdao_insertBoard 실행");
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO BOARD VALUES(?,?,?,?,DEFAULT)";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, 1);
			pstmt.setString(2, "작성자야");
			pstmt.setString(3, "제목이야");
			pstmt.setString(4, "내용이야");

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

}
