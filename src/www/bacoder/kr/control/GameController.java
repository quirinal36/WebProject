package www.bacoder.kr.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import www.bacoder.kr.db.DButil;
import www.bacoder.kr.model.Game;
import www.bacoder.kr.model.Movie;

public class GameController extends DButil implements Controller<Game>{

	@Override
	public int insert(Game input) {
		int result = 0;
		int i = 1;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
				.append("insert into Game (title, photoUrl, price, company, age, type, version, platform)")
				.append(" ")
				.append("value")
				.append(" ")
				.append("(?,?,?,?,?,?,?,?)").toString();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(i++, input.getTitle());
			pstmt.setString(i++, input.getPhotoUrl());
			pstmt.setInt(i++, input.getPrice());
			pstmt.setString(i++, input.getCompany());
			pstmt.setInt(i++, input.getAge());
			pstmt.setString(i++, input.getType());
			pstmt.setDouble(i++, input.getVersion());
			pstmt.setString(i++, input.getPlatform());
			pstmt.setInt(i++, input.getAge());
			
			logger.info(pstmt.toString());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int update(Game input) {
		int result = 0;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("update Game set ")
					.append(" ")
					.append("title=?, photoUrl=?, price=?, company=?, age=? , type=?, ")
					.append(" ")
					.append("version=?, platform=?")
					.append(" ")
					.append("where id=?").toString();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int i = 1;
			pstmt.setString(i++, input.getTitle());
			pstmt.setString(i++, input.getPhotoUrl());
			pstmt.setInt(i++, input.getPrice());
			pstmt.setString(i++, input.getCompany());
			pstmt.setInt(i++, input.getAge());
			pstmt.setString(i++, input.getType());
			pstmt.setDouble(i++, input.getVersion());
			pstmt.setString(i++, input.getPlatform());
			pstmt.setInt(i++, input.getId());
			
			logger.info(pstmt.toString());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			this.errorMsg = e.getMessage();
		}
		return result;
	}

	@Override
	public int delete(Game input) {
		int result = 0;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("delete from Game where id = ?").toString();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, input.getId());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			this.errorMsg = e.getMessage();
		}
		return result;
	}

	@Override
	public List<Game> select() {
		List<Game> result = new ArrayList<Game>();
		
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select * from Game").toString();
			Statement stmt = conn.createStatement();
			logger.info(stmt.toString());
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Game game = Game.parse(rs);
				result.add(game);
			}
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}		
		return result;
	}

	@Override
	public List<Game> select(Game input) {
		List<Game> result = new ArrayList<Game>();
		
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select * from Game")
					.append(" ")
					.append("where title like ?").toString();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + input.getTitle() + "%");
			
			logger.info(stmt.toString());
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Game game = Game.parse(rs);
				result.add(game);
			}
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}		
		return result;
	}

	@Override
	public Game selectOne(Game input) {
		Game game = new Game();
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select *")
					.append(" ")
					.append(" from Movie")
					.append(" ")
					.append("where id=?").toString();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, input.getId());
			
			logger.info(stmt.toString());
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				game = Game.parse(rs);
			}
			logger.info(game.toString());
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}	
		return game;
	}


}
