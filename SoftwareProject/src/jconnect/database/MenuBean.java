package jconnect.database;

public class MenuBean {

	private int resId;
	private String updateType;
	private String name;
	private float price;
	private String category;
	private String description;
	private String resName;
	private float deliFee;
	private boolean status;
	private String newCat;
	
	public String getNewCat() {
		return newCat;
	}
	public void setNewCat(String newCat) {
		this.newCat = newCat;
	}
	
	public String toString() {
		return "resId: "+ resId +", UpdateType: " + updateType + ", name: " + name +
				"price: " + price + ", category: " + category + ", description: " +
				description + ", resName: " + resName + ", deliFee: " + deliFee + 
				", status:" + status + ", newCat: " + newCat+ ".";
	}
	public boolean getStatus() {
		return status;
	}
	
	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String reName) {
		this.resName = reName;
	}

	public float getDeliFee() {
		return deliFee;
	}

	public void setDeliFee(float deliFee) {
		this.deliFee = deliFee;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getUpdateType() {
		return updateType;
	}

	public void setUpdateType(String updateType) {
		this.updateType = updateType;
	}

	public int getResId() {
		return resId;
	}

	public void setResId(int resId) {
		this.resId = resId;
	}
	
}
