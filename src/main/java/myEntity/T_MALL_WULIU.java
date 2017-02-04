package myEntity;

import java.util.Date;

public class T_MALL_WULIU {
	private int id;
	private String wtype;
	private Date wtime;
	private String wstatus;
	private int user_id;
	private int order_id;
	private String wfrom;
	private String wto;
	private String wperson;
	private String wtel;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWtype() {
		return wtype;
	}

	public void setWtype(String wtype) {
		this.wtype = wtype;
	}

	public Date getWtime() {
		return wtime;
	}

	public void setWtime(Date wtime) {
		this.wtime = wtime;
	}

	public String getWstatus() {
		return wstatus;
	}

	public void setWstatus(String wstatus) {
		this.wstatus = wstatus;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getWfrom() {
		return wfrom;
	}

	public void setWfrom(String wfrom) {
		this.wfrom = wfrom;
	}

	public String getWto() {
		return wto;
	}

	public void setWto(String wto) {
		this.wto = wto;
	}

	public String getWperson() {
		return wperson;
	}

	public void setWperson(String wperson) {
		this.wperson = wperson;
	}

	public String getWtel() {
		return wtel;
	}

	public void setWtel(String wtel) {
		this.wtel = wtel;
	}

}
