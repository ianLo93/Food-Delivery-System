package jconnect.database;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class CusOrderRetrival {

	static Connection conn;
	static PreparedStatement pst;
	
	public static void retriveOrder(CusOrderBean u) {
		ResultSet resultSet = null;
		String sql = "SELECT phone, special_instruction, address " + 
				"FROM order_info JOIN customer ON order_info.customer_id = customer.id " +
				"WHERE order_num = ?";
		try {
			conn = DatabaseInfo.connect2database();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, u.getOrder_num());
			resultSet = pst.executeQuery();
			if(resultSet.next()) {
				u.setAddress(resultSet.getString("address"));
				u.setPhone(resultSet.getString("phone"));
				u.setSpecial_instruction(resultSet.getString("special_instruction"));
			}
			conn.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}

	}
	
	public static void retriveItems(CusItemBean u) {
		ResultSet resultSet = null;
		String sql = "SELECT price, amount, name, dishes.restaurant_id FROM order_item JOIN dishes ON order_item.dish_id = dishes.id"
				+ " WHERE order_num = ?;";
		try {
			conn = DatabaseInfo.connect2database();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, u.getOrder_num());
			resultSet = pst.executeQuery();
			while(resultSet.next()) {
				ItemInfo item = new ItemInfo();
				item.setName(resultSet.getString("name"));
				item.setPrice(resultSet.getFloat("price"));
				item.setQuant(resultSet.getInt("amount"));
				item.setResId(resultSet.getInt("restaurant_id"));
				u.addItemLs(item);
			}
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
	}
	
	public static Map<Integer, String> getOrders(CusOrderBean u) {
		ResultSet resultSet = null;
		Map<Integer, String> ordersList = new HashMap<Integer, String>();
		String sql = "SELECT order_num, cus_state FROM order_info WHERE customer_id = ?;";
		//System.out.println("customer_id!!!!!!," +u.getCustomer_id());
		try {
			conn = DatabaseInfo.connect2database();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, u.getCustomer_id());
			resultSet = pst.executeQuery();

			while(resultSet.next()) {
				ordersList.put(resultSet.getInt(1), resultSet.getString(2));	
			}

			conn.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}
		
		return ordersList;
	}
	
}
