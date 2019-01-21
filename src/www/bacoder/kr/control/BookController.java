package www.bacoder.kr.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import www.bacoder.kr.db.DButil;
import www.bacoder.kr.model.Book;

public class BookController extends DButil implements Controller<Book> {

	@Override
	public int insert(Book input) {
		int result = 0;
		int i = 1;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
				.append("insert into Book (title, writer, photoUrl, price, publisher, publishedDate, page, national, language)")
				.append(" ")
				.append("value")
				.append(" ")
				.append("(?,?,?,?,?,?,?,?,?)").toString();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(i++, input.getTitle());
			pstmt.setString(i++, input.getWriter());
			pstmt.setString(i++, input.getPhotoUrl());
			pstmt.setInt(i++, input.getPrice());
			pstmt.setString(i++, input.getPublisher());
			pstmt.setString(i++, input.getPublishedDate());
			pstmt.setInt(i++, input.getPage());
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
	public int update(Book input) {
		int result = 0;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("update Game set ")
					.append(" ")
					.append("title=?, writer=?, photoUrl=?, price=?, publisher=? , publisiedDate=?, ")
					.append(" ")
					.append("page=?, national=?, language=?")
					.append(" ")
					.append("where id=?").toString();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int i = 1;
			pstmt.setString(i++, input.getTitle());
			pstmt.setString(i++, input.getWriter());
			pstmt.setString(i++, input.getPhotoUrl());
			pstmt.setInt(i++, input.getPrice());
			pstmt.setString(i++, input.getPublisher());
			pstmt.setString(i++, input.getPublishedDate());
			pstmt.setInt(i++, input.getPage());
			pstmt.setString(i++, input.getNational());
			pstmt.setString(i++, input.getLanguage());
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
	public int delete(Book input) {
		int result = 0;
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("delete from Book where id = ?").toString();
			
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
	public List<Book> select() {
		List<Book> result = new ArrayList<Book>();
		
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select * from Book").toString();
			Statement stmt = conn.createStatement();
			logger.info(stmt.toString());
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Book book = Book.parse(rs);
				result.add(book);
			}
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}		
		return result;
	}

	@Override
	public List<Book> select(Book input) {
		List<Book> result = new ArrayList<Book>();
		
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select * from Book")
					.append(" ")
					.append("where title like ?").toString();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + input.getTitle() + "%");
			
			logger.info(stmt.toString());
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Book book = Book.parse(rs);
				result.add(book);
			}
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}		
		return result;
	}

	@Override
	public Book selectOne(Book input) {
		Book book = new Book();
		try(Connection conn = getConnection()){
			String sql = new StringBuilder()
					.append("select *")
					.append(" ")
					.append(" from Book")
					.append(" ")
					.append("where id=?").toString();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, input.getId());
			
			logger.info(stmt.toString());
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				book = Book.parse(rs);
			}
			logger.info(book.toString());
		}catch(SQLException e) {
			errorMsg = e.getMessage();
			e.printStackTrace();
		}	
		return book;
	}

}
