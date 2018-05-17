package jconnect.database;

public class CusOrderBean {

	private int order_num;
	private int customer_id;
	private String phone;
	private String special_instruction;
	private String address;
	private String cus_state = "new";

	public String getCus_state() {
		return cus_state;
	}

	public void setCus_state(String cus_state) {
		this.cus_state = cus_state;
	}

	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSpecial_instruction() {
		return special_instruction;
	}

	public void setSpecial_instruction(String special_instruction) {
		this.special_instruction = special_instruction;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	
}
