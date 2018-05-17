package jconnect.database;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import java.util.ArrayList;

public class DatabaseInfo {

	public static Connection connect2database() {

		System.out.println("-------- PostgreSQL ------------");

		try {

			Class.forName("org.postgresql.Driver");

		} catch (ClassNotFoundException e) {

			System.out.println("Where is your PostgreSQL JDBC Driver? "
					+ "Include in your library path!");
			e.printStackTrace();
			return null;

		}

//		System.out.println("PostgreSQL JDBC Driver Registered!");

		Connection connection = null;

		try {

			connection = DriverManager.getConnection(
					"jdbc:postgresql://localhost:5432/FoodOrder", "postgres",
					"lastsorry");

		} catch (SQLException e) {

			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return null;

		}

		if (connection != null) {
			System.out.println("You made it, take control your database now!");
			return connection;
		} else {
			System.out.println("Failed to make connection!");
			return null;
		}
	}
	
//	public static void main(String[] argv) {
	public static ArrayList<ArrayList<String>> getRestaurant(String show, String tag, String filter){
		Connection con = connect2database();
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
			int row=0;
			ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
			
	
			while(rs.next()) {
				ArrayList<String> temp = new ArrayList<String>();
				for (int i = 1; i <= column; i++){
					temp.add(rs.getString(i));
				}
				result.add(temp);
			
			}
//			System.out.println(result.size());
//			for(int i = 0; i < result.size(); i++) {
//				for (int j =0; j < result.get(i).size(); j++) {
//					System.out.println(result.get(i).get(j));
//					
//				}
//			}
			return result;
			
			
		}catch (Exception e) {
			 System.out.println("why is null???");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
			 return null;
		}
		
		
	}
	
	
	
	
	
	
}
