package jconnect.database;
import java.sql.*;
import java.util.*;


public class EditCart {
	public ArrayList<CartItem> Cart = new ArrayList<CartItem>();
	public float tax_rate = 0.08f;
	public float deliver_fee;
	public String current_restaurant;

	
//	public void addItemById(int dish_id, int num) {
//		for(int i = 0; i < Cart.size(); i++) {
//			if (Cart.get(i).DishId == dish_id) {
//				Cart.get(i).number = Cart.get(i).number + num;
//				return ;
//			}
//		}
//		CartItem add = new CartItem(dish_id, num);
//		Cart.add(add);
//	}
	
	public void addItem(CartItem item) {
		Cart.add(item);
	}
	
	public ArrayList<CartItem> getAllItem() {
		return Cart;
	}
	public void removeItem(int dish_id) {
		for(int i = 0; i < Cart.size(); i++) {
			if (Cart.get(i).DishId == dish_id) {
				if(Cart.get(i).number > 1)
					Cart.get(i).number--;
				else 
					Cart.remove(Cart.get(i));
			}
		}
	}
	
	public float total_price() {
		float price = 0;
		for (int i = 0; i < Cart.size(); i++) {
			price = price + Cart.get(i).price * Cart.get(i).number;
		}
		return price;
	}

}
