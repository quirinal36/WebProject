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
	public String errorMsg;
	
	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	
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

	@Override
	public int update(Board input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Board input) {
		// TODO Auto-generated method stub
		return 0;
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
