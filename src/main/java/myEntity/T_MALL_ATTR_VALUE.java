package myEntity;

import java.util.Date;

public class T_MALL_ATTR_VALUE {
	private int id;
	private int attr_id;
	private int value_id;
	private int product_id;
	private String is_sku;
	private Date create_time;
	private int sku_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAttr_id() {
		return attr_id;
	}

	public void setAttr_id(int attr_id) {
		this.attr_id = attr_id;
	}

	public int getValue_id() {
		return value_id;
	}

	public void setValue_id(int value_id) {
		this.value_id = value_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getIs_sku() {
		return is_sku;
	}

	public void setIs_sku(String is_sku) {
		this.is_sku = is_sku;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public int getSku_id() {
		return sku_id;
	}

	public void setSku_id(int sku_id) {
		this.sku_id = sku_id;
	}

}
