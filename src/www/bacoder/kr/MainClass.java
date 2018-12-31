package www.bacoder.kr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.JSONObject;


import www.bacoder.kr.db.DButil;
import www.bacoder.kr.model.User;

public class MainClass {

	public static void main(String[] args) {
		String input = "{\"name\":\"leehg\",\"login\":\"bacoder\",\"pwd\":\"123456\",\"job\":\"student\"}";
		
		JSONObject json = new JSONObject(input);
		String name 	= json.getString("name");
		String login 	= json.getString("login");
		String pwd 		= json.getString("pwd");
		String job 		= json.getString("job");
		
		User user = new User();
		user.setName(name);
		user.setLogin(login);
		user.setPwd(pwd);
		user.setJob(job);
		
		System.out.println(user.toString());
		
		try(Connection conn = new DButil().getConnection()){
			int i = 1;
			
			StringBuilder builder = new StringBuilder();
			builder.append("insert into User ")
				.append("(login, pwd, name, birth, email, job, gender)")
				.append("values (?,?,?,?,?,?,?)");
			
			PreparedStatement pstmt = conn.prepareStatement(builder.toString());
			pstmt.setString(1, "bacoder");
			pstmt.setString(2, "1111");
			pstmt.setString(3, "바코더");
			pstmt.setString(4, "20181231");
			pstmt.setString(5, "admin@bacoder.kr");
			pstmt.setString(6, "학생");
			pstmt.setString(7, "남성");
			
			int result = pstmt.executeUpdate();
		}catch(SQLException e) {
			
		}
	}
}