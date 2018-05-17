package jconnect.database;


import java.sql.*;
import java.util.*;

public class ReviewMenu {

	private int current_restaurant_id;
	private String current_restaurant_name;
	private float delivery_fee;
	public ArrayList<ArrayList<String>> dish;
	public ArrayList<String> category;
	private String restaurant_image_path;
	
	public String getRestaurantImage_path() {
		return restaurant_image_path;
	}


	private void setRestaurantImage_path(String image_path) {
		this.restaurant_image_path = image_path;
	}


	public ReviewMenu(int restaurant_id) {
		setCurrent_restaurant_id(restaurant_id);
		
	
		Connection con = DatabaseInfo.connect2database();
		String sql= "SELECT * FROM restaurant WHERE id = " + current_restaurant_id +";";
	
		try{			
			PreparedStatement st = con.prepareStatement(sql);	
			ResultSet rs = st.executeQuery();

			while(rs.next()) {
				setCurrent_restaurant_name(rs.getString(2));
				setDelivery_fee(rs.getFloat(4));
				setRestaurantImage_path(rs.getString(5));
			}
			
			
		}catch (Exception e) {
			 System.out.println("ReviewNemu Error");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
		}
		setCategory();
		setDish();
	
	}
	
	
	public String getCurrent_restaurant_name() {
		return current_restaurant_name;
	}

	private void setCurrent_restaurant_name(String current_restaurant_name) {
		this.current_restaurant_name = current_restaurant_name;
	}
	
	public int getCurrent_restaurant_id() {
		return current_restaurant_id;
	}


	private void setCurrent_restaurant_id(int current_restaurant_id) {
		this.current_restaurant_id = current_restaurant_id;
	}


	public float getDelivery_fee() {
		return delivery_fee;
	}


	private void setDelivery_fee(float delivery_fee) {
		this.delivery_fee = delivery_fee;
	}



	public ArrayList<ArrayList<String>> getDish() {
		return dish;
	}


	private void setDish() {
		Connection con = DatabaseInfo.connect2database();
		String sql= "SELECT * FROM dishes WHERE restaurant_id = " + current_restaurant_id +";";
	
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
			this.dish = result;
			
			
		}catch (Exception e) {
			 System.out.println("setDish Error");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
			 this.dish = null;
		}
	}



	public ArrayList<String> getCategory() {
		return category;
	}



	public void setCategory() {
		Connection con = DatabaseInfo.connect2database();
		String sql= "SELECT DISTINCT category FROM dishes WHERE restaurant_id = " + current_restaurant_id +";";
	
		try{			
			PreparedStatement st = con.prepareStatement(sql);	
			ResultSet rs = st.executeQuery();
			ArrayList<String> result = new ArrayList<String>();			
	
			while(rs.next()) {
				result.add(rs.getString(1));		
			}
			this.category = result;
			
		}catch (Exception e) {
			 System.out.println("setCategory Error");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
			 this.category = null;
		}
		
	}


	
	
	
	public ArrayList<ArrayList<String>> getDishByCategory(String Category){
		Connection con = DatabaseInfo.connect2database();
		String sql= "SELECT * FROM dishes WHERE restaurant_id = " + current_restaurant_id + "AND category = '" + Category +"';";
	
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
			 System.out.println("getDishByCategory Error");
			 System.out.println(Category);
			 System.out.println(e.getMessage());
			 e.printStackTrace();
			 return null;
		}
	}
	

}
