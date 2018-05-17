package jconnect.database;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class OrderRetrival {

	static Connection conn;
	static PreparedStatement pst;
	
	public static void retriveOrder(OrderBean u) {
		ResultSet resultSet = null;
		String sql = "SELECT first_name, last_name, phone, special_instruction, address " + 
				"FROM order_info JOIN customer ON order_info.customer_id = customer.id " +
				"WHERE order_num = ?";
		try {
			conn = DatabaseInfo.connect2database();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, u.getOrder_num());
			resultSet = pst.executeQuery();
			if(resultSet.next()) {
				u.setAddress(resultSet.getString("address"));
				u.setFirst_name(resultSet.getString("first_name"));
				u.setLast_name(resultSet.getString("last_name"));
				u.setPhone(resultSet.getString("phone"));
				u.setSpecial_instruction(resultSet.getString("special_instruction"));
			}
			conn.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}

	}
	
	public static Map<Integer, String> getOrderList(OrderBean u) {
		ResultSet resultSet = null;
		Map<Integer, String> ordersList = new HashMap<Integer, String>();
		String sql = "SELECT order_num, state FROM order_info WHERE restaurant_id=?;";
		try {
			conn = DatabaseInfo.connect2database();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, u.getResId());
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
	
	public static int stateUpdate(OrderBean u) {
		int status_1 = 0;
		int status_2 = 0;
		String sql_1 = "UPDATE order_info SET state=? WHERE order_num=?;";
		String sql_2 = "UPDATE order_info SET cus_state=? WHERE order_num=?;";
		try {
			conn=DatabaseInfo.connect2database();
			pst = conn.prepareStatement(sql_1);
			if(u.getState().equalsIgnoreCase("ACCEPT"))
				{ pst.setString(1, "Processing"); }
			else { pst.setString(1, "Completed"); }
			pst.setInt(2, u.getOrder_num());
			status_1 = pst.executeUpdate();
			conn.close();
			conn=DatabaseInfo.connect2database();
			pst = conn.prepareStatement(sql_2);
			if(u.getState().equalsIgnoreCase("ACCEPT"))
				{ pst.setString(1, "Accepted"); }
			else { pst.setString(1, "Completed"); }
			pst.setInt(2, u.getOrder_num());
			status_2 = pst.executeUpdate();
			conn.close();
		} catch(Exception ex) {
			System.out.print(ex);
		}
		return status_1 + status_2;
	}
}
