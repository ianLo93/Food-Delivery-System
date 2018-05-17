package jconnect.database;
import java.sql.*;
import java.util.*;

public class PlaceOrder {
	public ArrayList<CartItem> cart = new ArrayList<CartItem>();
	public String instruction;
	public String address;
	public int customer_id;
	public int restaurant_id;
	public int order_num = 0;
	
	
	public String getInstruction() {
		return instruction;
	}


	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getCustomer_id() {
		return customer_id;
	}


	public void setCustomer_id(String username) {
		Connection con = DatabaseInfo.connect2database();
		String sql = "SELECT id FROM  customer WHERE username = '" + username + "';";
		try{
			
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
	
			while(rs.next()) {
				this.customer_id = rs.getInt(1);		
			}
		
		}catch (Exception e) {
			 System.out.println("why is null???");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
		}
	}


	public int getRestaurant_id() {
		return restaurant_id;
	}


	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}

	public void setCart(ArrayList<CartItem> Cart) {
		this.cart = Cart;
	}
	

	public ArrayList<CartItem> getCart() {
		return cart;
	}
	
	public void insert2order_item() {
		Connection con = DatabaseInfo.connect2database();
		System.out.println(cart.size());
		for(int i = 0; i < cart.size(); i++) {
			String sql = "INSERT INTO order_item VALUES(" + order_num + ", " + cart.get(i).DishId + ", " + restaurant_id + ", " + cart.get(i).number + ");";
			System.out.println(sql);
			try{	
				PreparedStatement st = con.prepareStatement(sql);	
				int insert_result = st.executeUpdate();
				if (insert_result==0) System.out.println("Fail");


			}catch (Exception e) {
				 System.out.println("There are some problems:");
				 System.out.println(e.getMessage());
				 e.printStackTrace();
			}
		}
	}
	public void insert2order_info() {

		ArrayList<Integer> IDs = new ArrayList<Integer>();  
		Connection con = DatabaseInfo.connect2database();
		String sql = "SELECT order_num FROM order_info";
	
		try{
			
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				IDs.add(rs.getInt(1));
			}
			
		}catch (Exception e) {
			 System.out.println("why is null???");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
		}
		
		Random rand = new Random();
		while(IDs.contains(rand.nextInt(10000000)+1000000)) {
			rand = new Random();
		}
		order_num =  rand.nextInt(10000000)+1000000;		
				
				
		sql = "INSERT INTO order_info VALUES(" + order_num + ", 'new', '" + instruction + "', '" + address + "', " + customer_id + ", " + restaurant_id + ", 'new');";		
		System.out.println(sql);
		try{
			
			PreparedStatement st = con.prepareStatement(sql);	
			int insert_result = st.executeUpdate();
			if (insert_result==0) System.out.println("Fail");


		}catch (Exception e) {
			 System.out.println("There are some problems:");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
		}	
	}
}
