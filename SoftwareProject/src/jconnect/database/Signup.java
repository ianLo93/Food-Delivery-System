package jconnect.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;
import java.sql.ResultSet;

public class Signup {
	private String username;
	
	public String getUsername() {
		return username;
	}
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public boolean valid = false;
	
	public Signup(String user, String pwd, String confirm_pwd, String actor) {
		if (pwd.equals(confirm_pwd)) {
			this.username = user;
			if(insert2database(user, pwd, actor) == 1) valid = true;
		}
	}
	
	public int GenerateId(String username, String actor) {
		ArrayList<Integer> ls1 = new ArrayList<Integer>();
		ArrayList<String> ls2 = new ArrayList<String>();
		Connection con = DatabaseInfo.connect2database();
		String sql = "SELECT id, username FROM customer;";
		if(actor.equals("vendor")) sql = "SELECT id, name FROM restaurant;";
		
		try{
			
			PreparedStatement st = con.prepareStatement(sql);	
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				ls1.add(rs.getInt(1));
				ls2.add(rs.getString(2));
			}


		}catch (Exception e) {
			 System.out.println("There are some problems:");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
		}
		if(ls2.contains(username)) return 0;
		Random rand = new Random();
		while(ls1.contains(rand.nextInt(10000)+1)) {
			rand = new Random();
		}
		return rand.nextInt(10000)+1;
		
		
	}
	
	public int insert2database(String user, String pwd, String actor) {
		System.out.println(actor);
		this.id = GenerateId(actor, user);
		if (id == 0) return 0;
		Connection con = DatabaseInfo.connect2database();
		String sql = "INSERT INTO customer VALUES("+ id +", '" +user+ "','" + pwd + "');";
		if(actor.equals("vendor")) sql = "INSERT INTO restaurant VALUES("+ id +", '" +user+ "','" + pwd + "', 0.0);";
		System.out.println(sql);
		
		try{
			
			PreparedStatement st = con.prepareStatement(sql);	
			int insert_result = st.executeUpdate();
			if (insert_result==0) System.out.println("Fail");
			return insert_result;


		}catch (Exception e) {
			 System.out.println("There are some problems:");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
			 return 0;
		}
	}
}
