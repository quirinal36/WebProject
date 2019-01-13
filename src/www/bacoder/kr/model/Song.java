package www.bacoder.kr.model;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Song extends Content {
	private String singer;		// 가수
	private String national;	// 국가
	private String language;	// 언어
	private String mvYoutubeUrl;// 뮤직비디오 유튜브주소
	
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
		return mvYoutubeUrl;
	}
	public void setMvYoutubeUrl(String mvYoutubeUrl) {
		this.mvYoutubeUrl = mvYoutubeUrl;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
