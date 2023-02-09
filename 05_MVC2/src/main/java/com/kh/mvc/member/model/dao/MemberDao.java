package com.kh.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.kh.mvc.member.model.vo.Member;

public class MemberDao {

	public Member findMemberById(String userId) {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String query = "SELECT * FROM MEMBER WHERE ID='admin2' AND STATUS='Y'";

		// 1.Driver 등록 (DriverManager)
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2. DBMS 연결 (Connection) : 매개변수로 DBMS 포트, ID, PWD
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "WEB", "WEB");

			// 3. Statement 생성(실제 쿼리문을 수행하는 객체)
			statement = connection.createStatement();

			// 4. statement에 쿼리 입력 - 전송, resultset 반환 - 결과 받기
			resultSet = statement.executeQuery(query);

			// 결과행이 없을 때까지 반복
			while (resultSet.next()) {
				System.out.println(resultSet.getInt("NO"));
				System.out.println(resultSet.getString("ID"));
				System.out.println(resultSet.getString(3));
				System.out.println(resultSet.getString(4));
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				// while문에 error가 있더라도 멈추지 않고 모두 닫아주는 구문
				resultSet.close();
				statement.close();
				connection.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return null;
	}

}
