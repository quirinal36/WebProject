package www.bacoder.kr.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import www.bacoder.kr.db.DButil;
import www.bacoder.kr.model.Movie;

public class MovieController extends DButil implements Controller<Movie> {

	@Override
	public int insert(Movie input) {
		int result = 0;
		int i = 1;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
				.append("insert into Movie (title, photoUrl, runningTime, openDate, director, actor, national, language, age)")
				.append(" ")
				.append("value")
				.append(" ")
				.append("(?,?,?,?,?,?,?,?,?)").toString();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(i++, input.getTitle());
			pstmt.setString(i++, input.getPhotoUrl());
			pstmt.setInt(i++, input.getRunningTime());
			pstmt.setString(i++, input.getOpenDate());
			pstmt.setString(i++, input.getDirector());
			pstmt.setString(i++, input.getActor());
			pstmt.setString(i++, input.getNational());
			pstmt.setString(i++, input.getLanguage());
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
	public int update(Movie input) {
		int result = 0;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("update Movie set ")
					.append(" ")
					.append("title=?, photoUrl=?, runningTime=?, openDate=?, director=? , actor=?, ")
					.append(" ")
					.append("national=?, language=?, age=?")
					.append(" ")
					.append("where id=?").toString();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int i = 1;
			pstmt.setString(i++, input.getTitle());
			pstmt.setString(i++, input.getPhotoUrl());
			pstmt.setInt(i++, input.getRunningTime());
			pstmt.setString(i++, input.getOpenDate());
			pstmt.setString(i++, input.getDirector());
			pstmt.setString(i++, input.getActor());
			pstmt.setString(i++, input.getNational());
			pstmt.setString(i++, input.getLanguage());
			pstmt.setInt(i++, input.getAge());
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
	public int delete(Movie input) {
		int result = 0;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("delete from Movie where id = ?").toString();
			
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
	public List<Movie> select() {
		List<Movie> result = new ArrayList<Movie>();
		
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select * from Movie").toString();
			Statement stmt = conn.createStatement();
			logger.info(stmt.toString());
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Movie movie = Movie.parseMovie(rs);
				result.add(movie);
			}
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}		
		return result;
	}

	@Override
	public List<Movie> select(Movie input) {
		List<Movie> result = new ArrayList<Movie>();
		
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select * from Movie")
					.append(" ")
					.append("where title like ?").toString();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + input.getTitle() + "%");
			
			logger.info(stmt.toString());
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Movie movie = Movie.parseMovie(rs);
				result.add(movie);
			}
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}		
		return result;
	}

	@Override
	public Movie selectOne(Movie input) {
		Movie movie = new Movie();
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
				movie = Movie.parseMovie(rs);
			}
			logger.info(movie.toString());
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}	
		return movie;
	}

}
