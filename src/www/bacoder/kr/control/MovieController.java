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
				.append("insert into Movie (title, photoUrl, runningTime, openDate, director, actor, national, language)")
				.append(" ")
				.append("value")
				.append(" ")
				.append("(?,?,?,?,?,?,?,?)").toString();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(i++, input.getTitle());
			pstmt.setString(i++, input.getPhotoUrl());
			pstmt.setInt(i++, input.getRunningTime());
			pstmt.setString(i++, input.getOpenDate());
			pstmt.setString(i++, input.getDirector());
			pstmt.setString(i++, input.getActor());
			pstmt.setString(i++, input.getNational());
			pstmt.setString(i++, input.getLanguage());
			
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Movie input) {
		// TODO Auto-generated method stub
		return 0;
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
		}		
		return result;
	}

	@Override
	public Movie selectOne(Movie input) {
		// TODO Auto-generated method stub
		return null;
	}

}
