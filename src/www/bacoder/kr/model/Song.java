package www.bacoder.kr.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Song extends Content {
	private String singer;		// 가수
	private String national;	// 국가
	private String language;	// 언어
	private String mvYoutubeUrl;// 뮤직비디오 유튜브주소
	
	public Song() {
	}
	public Song(int id) {
		this.id = id;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
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
	public String getMvYoutubeUrl() {
		mvYoutubeUrl = mvYoutubeUrl.replaceAll("watch", "embed");
		return mvYoutubeUrl;
	}
	public void setMvYoutubeUrl(String mvYoutubeUrl) {
		this.mvYoutubeUrl = mvYoutubeUrl;
	}
	public static Song parse(ResultSet rs) throws SQLException {
		Song song = new Song();
		song.setTitle(rs.getString("title"));
		song.setPhotoUrl(rs.getString("photoUrl"));
		song.setSinger(rs.getString("singer"));
		song.setNational(rs.getString("national"));
		song.setLanguage(rs.getString("language"));
		song.setMvYoutubeUrl(rs.getString("mvYoutubeUrl"));
		song.setId(rs.getInt("id"));
		return song;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
