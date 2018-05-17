package jconnect.database;

import java.util.*;

public class CusItemBean {

	private int order_num;
	private List<ItemInfo> itemLs = new ArrayList<ItemInfo>();
	private float price;
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public List<ItemInfo> getItemLs() {
		return itemLs;
	}
	public void addItemLs(ItemInfo item) {
		itemLs.add(item);
	}
	
	
}
