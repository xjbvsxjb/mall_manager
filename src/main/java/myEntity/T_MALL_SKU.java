package myEntity;

import java.util.Date;

public class T_MALL_SKU {

	private int id;
	private String sku_name;
	private int product_id;
	private int kucun;
	private float price;
	private Date create_time;
	T_MALL_PRODUCT product;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSku_name() {
		return sku_name;
	}

	public void setSku_name(String sku_name) {
		this.sku_name = sku_name;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getKucun() {
		return kucun;
	}

	public void setKucun(int kucun) {
		this.kucun = kucun;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public T_MALL_PRODUCT getProduct() {
		return product;
	}

	public void setProduct(T_MALL_PRODUCT product) {
		this.product = product;
	}

}
