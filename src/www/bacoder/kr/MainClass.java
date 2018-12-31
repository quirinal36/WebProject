package www.bacoder.kr;

import org.json.JSONObject;

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
	}
}