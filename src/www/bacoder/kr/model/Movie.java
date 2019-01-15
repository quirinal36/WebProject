package www.bacoder.kr.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Movie extends Content {
	private int runningTime;		// 러닝타임
	private String openDate;		// 개봉일
	private String director;		// 감독
	private String actor;			// 배우들
	private String national;		// 국가
	private String language;		// 언어
	private int age;				// 사용자연령
	private int price;				// 가격
	
	public int getRunningTime() {
		return runningTime;
	}
	public void setRunningTime(int runningTime) {
		this.runningTime = runningTime;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public static Movie parseMovie(ResultSet rs) throws SQLException {
		Movie movie = new Movie();
		movie.setId(rs.getInt("id"));
		movie.setProductId(rs.getString("productId"));
		movie.setTitle(rs.getString("title"));
		movie.setWriter(rs.getString("writer"));
		movie.setPhotoUrl(rs.getString("photoUrl"));
		movie.setPrice(rs.getInt("price"));
		movie.setRunningTime(rs.getInt("runningTime"));
		movie.setOpenDate(rs.getString("openDate"));
		movie.setDirector(rs.getString("director"));
		movie.setActor(rs.getString("actor"));
		movie.setNational(rs.getString("national"));
		movie.setLanguage(rs.getString("language"));
		movie.setAge(rs.getInt("age"));
		return movie;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
