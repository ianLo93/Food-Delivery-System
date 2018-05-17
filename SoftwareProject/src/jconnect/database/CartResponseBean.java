package jconnect.database;
import java.sql.*;
import java.util.*;

public class CartResponseBean {
	public ArrayList<CartItem> Cart;

	public CartResponseBean() {
		
	}


	public ArrayList<CartItem> getCart() {
		return Cart;
	}

	public void setCart(ArrayList<CartItem> cart) {
		Cart = cart;
	}
	
	

}
