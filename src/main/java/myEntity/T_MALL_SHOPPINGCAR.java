package myEntity;

public class T_MALL_SHOPPINGCAR {

	private int id;
	private float pprice;
	private int shul;
	private double total_money;
	private int user_id;
	private int product_id;
	private int sku_id;
	private String sku_name;
	private String img_url;
	private String is_checked;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getPprice() {
		return pprice;
	}

	public void setPprice(float pprice) {
		this.pprice = pprice;
	}

	public int getShul() {
		return shul;
	}

	public void setShul(int shul) {
		this.shul = shul;
	}

	public double getTotal_money() {
		return total_money;
	}

	public void setTotal_money(double total_money) {
		this.total_money = total_money;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getSku_id() {
		return sku_id;
	}

	public void setSku_id(int sku_id) {
		this.sku_id = sku_id;
	}

	public String getSku_name() {
		return sku_name;
	}

	public void setSku_name(String sku_name) {
		this.sku_name = sku_name;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getIs_checked() {
		return is_checked;
	}

	public void setIs_checked(String is_checked) {
		this.is_checked = is_checked;
	}

}
