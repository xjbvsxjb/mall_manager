package myEntity;

import java.util.Date;
import java.util.List;

public class T_MALL_ATTR {
	private int id;
	private String attribute;
	private String flag;
	private int fenlei2_id;
	private Date create_time;
	private List<T_MALL_VALUE> lvalue;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public int getFenlei2_id() {
		return fenlei2_id;
	}

	public void setFenlei2_id(int fenlei2_id) {
		this.fenlei2_id = fenlei2_id;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public List<T_MALL_VALUE> getLvalue() {
		return lvalue;
	}

	public void setLvalue(List<T_MALL_VALUE> lvalue) {
		this.lvalue = lvalue;
	}

}
