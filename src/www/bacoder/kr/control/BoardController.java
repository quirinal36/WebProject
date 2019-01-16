package www.bacoder.kr.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import www.bacoder.kr.db.DButil;
import www.bacoder.kr.model.Board;

public class BoardController extends DButil implements Controller<Board>{
	
	@Override
	public int insert(Board input) {
		int result = 0;
		int i = 1;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
				.append("insert into Board (title, content, writer, wdate)")
				.append(" ")
				.append("value")
				.append(" ")
				.append("(?,?,?,NOW())").toString();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(i++, input.getTitle());
			pstmt.setString(i++, input.getContent());
			pstmt.setString(i++, input.getWriter());
			logger.info(pstmt.toString());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 실습과제 ( 2019.01.16 예정 )
	 */
	@Override
	public int update(Board input) {
		int result = 0;
		try(Connection conn = getConnection()){
			// 1. 데이터베이스 커넥션
			
			// 2. SQL 문 준비 -> 물음표를 포함, 미완성 SQL문
			String sql = "update Board set title=?, content=? where id=?";
			
			// 3. SQL 문 빈칸완성 -> 물음표를 대체, 완성된 SQL문
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, input.getTitle());
			pstmt.setString(2, input.getContent());
			pstmt.setInt(3, input.getId());
			
			// 4. SQL 문 실행
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}	
		return result;
	}

	/**
	 * 실습과제 ( 2019.01.16 예정 )
	 */
	@Override
	public int delete(Board input) {
		int result = 0;
		try(Connection conn = getConnection()){ // 1. 데이터베이스 접속
			// 2. SQL 문 작성 (? 포함 : 미완성)
			String sql = "delete from Board where id = ?";
			// 3. SQL 문 완성 (? 대체 : 완성)
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, input.getId());
			
			// 4. 쿼리문 실행
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			errorMsg = e.getMessage();
		}
		return result;
	}

	@Override
	public List<Board> select() {
		List<Board> list = new ArrayList<>();
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select * from Board").toString();
			Statement stmt = conn.createStatement();
			logger.info(stmt.toString());
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Board board = Board.parseBoard(rs);
				list.add(board);
			}
		}catch(SQLException e) {
			errorMsg = e.getMessage();
		}		
		return list;
	}

	@Override
	public List<Board> select(Board input) {
		List<Board> list = new ArrayList<>();
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select * from Board ")
					.append(" ")
					.append("where writer like ? ")
					.toString();
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+input.getWriter()+"%");
			logger.info(stmt.toString());
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Board board = Board.parseBoard(rs);
				list.add(board);
			}
		}catch(SQLException e) {
			errorMsg = e.getMessage();
		}		
		return list;
	}

	/**
	 * 실습과제 2019.01.14
	 * 
	 * board/detail.jsp 에 사용됨 
	 * 
	 */
	@Override
	public Board selectOne(Board input) {
		Board result = new Board();
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select * from Board ")
					.append(" ")
					.append("where id = ? ")
					.toString();
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, input.getId());
			logger.info(stmt.toString());
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				result = Board.parseBoard(rs);
			}
		}catch(SQLException e) {
			errorMsg = e.getMessage();
		}	
		return result;
	}
}
