package jconnect.database;


import java.sql.*;
import java.util.ArrayList;
public class Login {

	private String username;
	private int id;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public boolean valid = false;
	
	public Login(String user, String pwd, String actor) {
		if (check_security(user,pwd,actor)) {
			this.username = user;
			this.valid = true;
		}
	}
	
	public String getUsername() {
		return username;
	}


	public boolean check_security(String user, String pwd, String actor) {
		Connection con = DatabaseInfo.connect2database();
		String sql = "SELECT id, password FROM restaurant WHERE name='" + user + "';";
		if (actor.equals("customer")) sql = "SELECT id, password FROM customer WHERE username='" + user + "';";
		System.out.println(sql);
		try{
			
			PreparedStatement st = con.prepareStatement(sql);	
			ResultSet rs = st.executeQuery();
			
			rs.next();
			this.setId(rs.getInt(1));
			String password = rs.getString(2);
			if (password.equals(pwd)) {
				return true;
			}
			else {
				//System.out.println("Failed Login!!!");
				return false;
			}

		}catch (Exception e) {
			 System.out.println("There are some problems:");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
			 return false;
		}
	}

}
