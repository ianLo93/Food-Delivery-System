package jconnect.database;

import java.sql.*;

public class ItemRetrival {

	static Connection conn;
	static PreparedStatement pst;
	
	public static void retriveOrder(ItemBean u) {
		ResultSet resultSet = null;
		String sql = "SELECT name, amount FROM order_item JOIN dishes ON " + 
						"order_item.dish_id = dishes.id " + " WHERE order_num = ?";
		try {
			conn = DatabaseInfo.connect2database();
			pst = conn.prepareStatement(sql);
			pst.setInt(1, u.getOrder_num());
			resultSet = pst.executeQuery();

			while(resultSet.next()) {
				u.insertItems(resultSet.getString("name"), resultSet.getInt("amount"));
			}

			conn.close();
		} catch(Exception ex) {
			System.out.println(ex);
		}

	}
	
}
