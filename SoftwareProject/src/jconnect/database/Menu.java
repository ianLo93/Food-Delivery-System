package jconnect.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

public class Menu {
	public static ArrayList<ArrayList<String>> getRestaurant(String show, String tag, String filter){
		Connection con = DatabaseInfo.connect2database();
		String sql;
		if (tag == "all")
			sql = "SELECT " + show + " FROM restaurant;";
		else
			sql = "SELECT " + show + " FROM restaurant WHERE " + tag + "=" + filter + ";";
	
		try{
			
			PreparedStatement st = con.prepareStatement(sql);
		
			ResultSet rs = st.executeQuery();
			ResultSetMetaData rsmd= rs.getMetaData();
			int column = rsmd.getColumnCount();
			ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
			
	
			while(rs.next()) {
				ArrayList<String> temp = new ArrayList<String>();
				for (int i = 1; i <= column; i++){
					temp.add(rs.getString(i));
				}
				result.add(temp);
			
			}
			return result;
		}catch (Exception e) {
			 System.out.println("why is null???");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
			 return null;
		}
		
		
	}
	
	
	
}
