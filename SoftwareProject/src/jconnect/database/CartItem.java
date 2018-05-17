package jconnect.database;
import java.sql.*;
import java.util.*;

public class CartItem {
	public int DishId;
	public String DishName;
	public float price;
	public int number;
	
	public CartItem(int dish_id, int num) {
		this.DishId = dish_id;
		this.number = num;
		
		Connection con = DatabaseInfo.connect2database();
		String sql= "SELECT * FROM dishes WHERE id = " + Integer.toString(dish_id) +";";
	
		try{			
			PreparedStatement st = con.prepareStatement(sql);	
			ResultSet rs = st.executeQuery();
	
			while(rs.next()) {
				DishName = rs.getString(2);
				price = rs.getFloat(4);
		
			}
			
			
		}catch (Exception e) {
			 System.out.println("setDish Error");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
		}
	}
}
