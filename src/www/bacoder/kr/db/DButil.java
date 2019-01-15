package www.bacoder.kr.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Logger;

public class DButil {
	// 상속 가능한 객체
	protected Logger logger = Logger.getLogger(DButil.class.getSimpleName());
	
	// 상속 불가능한 객체
	private final String userName 	= "user_bacoder";
	private final String password 	= "bacoder";
	private final String dbms 		= "mysql";
	private final String dbName 		= "bacoder_schema";
	private final String serverName 	= "35.194.106.34";
	private final int portNumber 		= 3306;
	public String errorMsg;
	
	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	
	// 상속 가능한 메소드
	public Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	    Connection conn = null;
	    Properties connectionProps = new Properties();
	    connectionProps.put("user", this.userName);
	    connectionProps.put("password", this.password);

	    if (this.dbms.equals("mysql")) {
	        conn = DriverManager.getConnection(
	                   "jdbc:" + this.dbms + "://" +
	                   this.serverName +
	                   ":" + this.portNumber + "/" +
	                   this.dbName + "?" +
	                   "useSSL=false",
	                   connectionProps);
	    }
	    return conn;
	}
}
