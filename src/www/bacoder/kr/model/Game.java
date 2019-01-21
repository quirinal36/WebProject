package www.bacoder.kr.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Game extends Content {
	private String company;		// 제작회사
	private int age;			// 사용가능연령
	private String type;		// 게임 유형 (RPG, FPS, 아케이드, 슛팅 등등)
	private double version;		// 현재 버젼
	private String platform;	// 스마트폰, PC, 닌텐도, 플레이스테이션
	private int price;			// 가격
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getVersion() {
		return version;
	}
	public void setVersion(double version) {
		this.version = version;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public static Game parse(ResultSet rs) throws SQLException {
		Game game = new Game();
		game.setId(rs.getInt("id"));
		game.setPhotoUrl(rs.getString("photoUrl"));
		game.setPrice(rs.getInt("price"));
		game.setCompany(rs.getString("company"));
		game.setAge(rs.getInt("age"));
		game.setType(rs.getString("type"));
		game.setVersion(rs.getDouble("version"));
		game.setPlatform(rs.getString("platform"));
		return game;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
