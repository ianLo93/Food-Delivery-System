package jconnect.database;

public class OrderBean {

	private int order_num;
	private int resId;
	private String state = "NEW";
	private String first_name;
	private String last_name;
	private String phone;
	private String special_instruction;
	private String address;

	

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}
	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
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
