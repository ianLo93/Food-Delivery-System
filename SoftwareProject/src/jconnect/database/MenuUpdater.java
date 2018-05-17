package jconnect.database;

import java.sql.*;
import java.util.*;

public class MenuUpdater {

	static Connection conn;
	static PreparedStatement pst;
	static int id_num;
	
	public static int idAssigner() {
		String sql = "SELECT id FROM dishes;";
		ResultSet result = null;
		List<Integer> idLs = new ArrayList<Integer>();
		try{
			conn = DatabaseInfo.connect2database();;
			pst = conn.prepareStatement(sql);
			result = pst.executeQuery();
			while(result.next()) {
				idLs.add(result.getInt("id"));
//				System.out.println(result.getInt("id"));
			}
		} catch(Exception ex) {
			System.out.println(ex);
		}
		Random rand = new Random();
		int tmp = rand.nextInt(900000)+100000;
		while(idLs.contains(tmp)) {
			tmp = rand.nextInt(900000)+100000;
		}
		return tmp;
		
	}
	
	public static int updateMenu(MenuBean u) {
		int status=0;
		String sql;
		id_num = idAssigner();
		
		try {
			conn = DatabaseInfo.connect2database();
			if(u.getUpdateType() == null)
				return status;
			if(u.getUpdateType().equalsIgnoreCase("NEW")) {
				sql = "INSERT INTO dishes VALUES(?,?,?,?,?,?,?);";
				pst = conn.prepareStatement(sql);
				pst.setInt(1, id_num);
				pst.setString(2, u.getName());
				pst.setInt(3, u.getResId());
				pst.setFloat(4, u.getPrice());
				pst.setString(5, u.getDescription());
				if(u.getCategory().equalsIgnoreCase("NEW")) 
					pst.setString(6, u.getNewCat());
				else { pst.setString(6, u.getCategory()); };
				pst.setString(7, null);
				status = pst.executeUpdate();
			} else {
				sql = "UPDATE dishes SET name=?, restaurant_id=?, price=?, description=?, category=? WHERE id=" + 
						u.getUpdateType() + ";";
				pst = conn.prepareStatement(sql);
				pst.setString(1, u.getName());
				pst.setInt(2, u.getResId());
				pst.setFloat(3, u.getPrice());
				pst.setString(4, u.getDescription());
				if(u.getCategory().equalsIgnoreCase("NEW")) 
					pst.setString(5, u.getNewCat());
				else { pst.setString(5, u.getCategory()); }
				status = pst.executeUpdate();
			}
			conn.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return status;
	}
	
	public static Map<Integer, String> getMenu(MenuBean u) {
		ResultSet resultSet;
		String sql = "SELECT dishes.name, dishes.id FROM dishes JOIN restaurant ON dishes.restaurant_id = restaurant.id WHERE restaurant.id = ?;";
		Map<Integer, String> menu = new HashMap<Integer, String>();
		
		try {
			conn = DatabaseInfo.connect2database();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, u.getResId());
			resultSet = pst.executeQuery();
			while(resultSet.next()) {
				menu.put(resultSet.getInt("id"), resultSet.getString("name"));
			}
			conn.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		return menu;
	}
	
	public static List<String> getCategories(MenuBean u) {
		ResultSet resultSet;
		String sql = "SELECT DISTINCT category FROM dishes WHERE restaurant_id = ?;";
		List<String> categories = new ArrayList<String>();
		
		try {
			conn = DatabaseInfo.connect2database();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, u.getResId());
			resultSet = pst.executeQuery();
			while(resultSet.next()) {
				categories.add(resultSet.getString(1));
			}
			conn.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return categories;
	}
	
	public static void getRes(MenuBean u) {
		ResultSet resultSet;
		String sql = "SELECT name, deliver_fee FROM restaurant WHERE id = ?;";
		
		try {
			conn = DatabaseInfo.connect2database();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, u.getResId());
			resultSet = pst.executeQuery();
			if(resultSet.next()) {
				u.setDeliFee(resultSet.getFloat("deliver_fee"));
				u.setResName(resultSet.getString("name"));
			}
			conn.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}

	}
	
}
