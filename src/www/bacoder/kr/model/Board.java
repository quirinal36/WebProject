package www.bacoder.kr.model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Board {
	private int id;
	private String title;
	private String content;
	private Date date;
	private String writer;
	
	public Board() {
	}
	
	public Board(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
	public static Board parseBoard(ResultSet rs) throws SQLException {
		Board result = new Board();
		result.setId(rs.getInt("id"));
		result.setTitle(rs.getString("title"));
		result.setContent(rs.getString("content"));
		result.setWriter(rs.getString("writer"));
		result.setDate(rs.getDate("wdate"));
		return result;
	}
}
