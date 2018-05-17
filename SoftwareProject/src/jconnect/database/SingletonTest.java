package jconnect.database;

public class SingletonTest {
	public static void main(String[] argv) {
		int dish_id = 6258;
		int dish_num = 2;
		CartItem item = new CartItem(dish_id, dish_num); 
		System.out.println(item.DishName);
		EditCart foodcart = new EditCart();
		foodcart.addItem(item);
		
		
		
	}
}
