package www.bacoder.kr.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import www.bacoder.kr.db.DButil;
import www.bacoder.kr.model.Song;

public class SongController extends DButil implements Controller<Song> {
	
	@Override
	public int insert(Song input) {
		int result = 0;
		int i = 1;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
				.append("insert into Song") 
				.append(" ")
				.append("(title, photoUrl, singer, national, language, mvYoutubeUrl)")
				.append(" ")
				.append("value")
				.append(" ")
				.append("(?,?,?,?,?,?)").toString();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(i++, input.getTitle());
			pstmt.setString(i++, input.getPhotoUrl());
			pstmt.setString(i++, input.getSinger());
			pstmt.setString(i++, input.getNational());
			pstmt.setString(i++, input.getLanguage());
			pstmt.setString(i++, input.getMvYoutubeUrl());
			
			logger.info(pstmt.toString());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int update(Song input) {
		int result = 0;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("update Song set ")
					.append(" ")
					.append("title=?, photoUrl=?, singer=?, national=?, language=? , mvYoutubeUrl=?")
					.append(" ")
					.append("where id=?").toString();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int i = 1;
			pstmt.setString(i++, input.getTitle());
			pstmt.setString(i++, input.getPhotoUrl());
			pstmt.setString(i++, input.getSinger());
			pstmt.setString(i++, input.getNational());
			pstmt.setString(i++, input.getLanguage());
			pstmt.setString(i++, input.getMvYoutubeUrl());
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
	public int delete(Song input) {
		int result = 0;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("delete from Song where id = ?").toString();
			
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
	public List<Song> select() {
		List<Song> result = new ArrayList<Song>();
		
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select * from Song").toString();
			Statement stmt = conn.createStatement();
			logger.info(stmt.toString());
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Song song = Song.parse(rs);
				result.add(song);
			}
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}		
		return result;
	}

	@Override
	public List<Song> select(Song input) {
		List<Song> result = new ArrayList<Song>();
		
		try(Connection conn = getConnection()){
			StringBuilder sql = new StringBuilder()
					.append("select * from Song")
					.append(" ")
					.append("where title like ?");
			PreparedStatement stmt = conn.prepareStatement(sql.toString());
			stmt.setString(1, "%" + input.getTitle() + "%");
			
			logger.info(stmt.toString());
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Song song = Song.parse(rs);
				result.add(song);
			}
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}		
		return result;
	}

	@Override
	public Song selectOne(Song input) {
		Song song = new Song();
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select *")
					.append(" ")
					.append(" from Song")
					.append(" ")
					.append("where id=?").toString();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, input.getId());
			
			logger.info(stmt.toString());
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				song = Song.parse(rs);
			}
			logger.info(song.toString());
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}	
		return song;
	}

}
