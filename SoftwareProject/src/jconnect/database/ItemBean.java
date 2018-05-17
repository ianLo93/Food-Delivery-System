package jconnect.database;

import java.util.*;

public class ItemBean {

	private int order_num;
	private Map<String, Integer> items = new HashMap<String, Integer>();

	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public Map<String, Integer> getItems() {
		return items;
	}
	
	public void insertItems(String name, int amount) {
		items.put(name, amount);
	}
	
}
