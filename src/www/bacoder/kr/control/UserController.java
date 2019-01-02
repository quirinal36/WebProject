package www.bacoder.kr.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.json.JSONObject;

import www.bacoder.kr.db.DButil;
import www.bacoder.kr.model.User;

public class UserController {
	Logger logger = Logger.getLogger(UserController.class.getSimpleName());
	
	/**
	 * User insert 
	 * @param user
	 * @return
	 */
	public JSONObject addUser(User user){
		JSONObject result = new JSONObject();
		int updateResult = 0;
		
		try(Connection conn = new DButil().getConnection()){
			int i = 1;
			
			StringBuilder builder = new StringBuilder();
			builder.append("insert into User ")
				.append("(login, pwd, name, birth, email, job, gender, address, postcode)")
				.append("values (?,?,?,?,?,?,?,?,?)");
			
			PreparedStatement pstmt = conn.prepareStatement(builder.toString());
			pstmt.setString(i++, user.getLogin());
			pstmt.setString(i++, user.getPwd());
			pstmt.setString(i++, user.getName());
			pstmt.setString(i++, user.getBirth());
			pstmt.setString(i++, user.getEmail());
			pstmt.setString(i++, user.getJob());
			pstmt.setString(i++, user.getGender());
			pstmt.setString(i++, user.getAddress());
			pstmt.setString(i++, user.getPostcode());
			
			logger.info(pstmt.toString());
			
			updateResult = pstmt.executeUpdate();
		}catch(SQLException e) {
			result.put("message", e.getMessage());
//			e.printStackTrace();
		}
		result.put("result", updateResult);
		return result;
	}
	
	/**
	 * User List 를 가져온
	 * @return
	 */
	public List<User> getUserList(){
		List<User> result = new ArrayList<>();
		try(Connection conn = new DButil().getConnection()){
			StringBuilder builder = new StringBuilder();
			builder.append("Select id, login, name, birth, email, job, gender ")
				.append("from User");
			PreparedStatement pstmt = conn.prepareStatement(builder.toString());
			
			logger.info(pstmt.toString());
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setLogin(rs.getString("login"));
				user.setName(rs.getString("name"));
				user.setBirth(rs.getString("birth"));
				user.setEmail(rs.getString("email"));
				user.setJob(rs.getString("job"));
				user.setGender(rs.getString("gender"));
				
				result.add(user);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 로그인하기
	 * 
	 * @param user
	 * @return
	 */
	public User getUser(User user) {
		try(Connection conn = new DButil().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("Select id, login, name, birth, email, job, gender ")
				.append("from User ")
				.append("where login = ? and pwd = ?");
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, user.getLogin());
			pstmt.setString(2, user.getPwd());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				user.setId(rs.getInt("id"));
				user.setLogin(rs.getString("login"));
				user.setName(rs.getString("name"));
				user.setBirth(rs.getString("birth"));
				user.setEmail(rs.getString("email"));
				user.setJob(rs.getString("job"));
				user.setGender(rs.getString("gender"));
			}
			return user;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public User getUser(int id) {
		User user = new User();
		
		try(Connection conn = new DButil().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("Select id, login, name, birth, email, job, gender, postcode, address ")
				.append("from User ")
				.append("where id=?");
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				user.setId(rs.getInt("id"));
				user.setLogin(rs.getString("login"));
				user.setName(rs.getString("name"));
				user.setBirth(rs.getString("birth"));
				user.setEmail(rs.getString("email"));
				user.setJob(rs.getString("job"));
				user.setGender(rs.getString("gender"));
				user.setPostcode(rs.getString("postcode"));
				user.setAddress(rs.getString("address"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return user;
	}
}
