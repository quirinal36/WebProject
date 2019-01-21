package www.bacoder.kr.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Book extends Content {
	private String publisher; 		// 출판사
	private String publishedDate; 	// 출판일
	private int page; 				// 페이지수
	private String national; 		// 국가
	private String language; 		// 언어
	private int price;				// 가격
	
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPublishedDate() {
		return publishedDate;
	}
	public void setPublishedDate(String publishedDate) {
		this.publishedDate = publishedDate;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getNational() {
		return national;
	}
	public void setNational(String national) {
		this.national = national;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	public static Book parse(ResultSet rs) throws SQLException {
		Book book = new Book();
		book.setId(rs.getInt("id"));
		book.setTitle(rs.getString("title"));
		book.setWriter(rs.getString("writer"));
		book.setPhotoUrl(rs.getString("photoUrl"));
		book.setPrice(rs.getInt("price"));
		book.setPublisher(rs.getString("publisher"));
		book.setPublishedDate(rs.getString("publishedDate"));
		book.setPage(rs.getInt("page"));
		book.setNational(rs.getString("national"));
		book.setLanguage(rs.getString("language"));
		return book;
	}
}
