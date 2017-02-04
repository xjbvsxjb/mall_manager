package myEntity;

import java.util.List;

public class T_MALL_PRODUCT {

	private int id;
	private String pname;
	private int oneid;
	private int twoid;
	private int tmid;
	private String pimage;
	private List<T_MALL_IMAGE> limg;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getOneid() {
		return oneid;
	}

	public void setOneid(int oneid) {
		this.oneid = oneid;
	}

	public int getTwoid() {
		return twoid;
	}

	public void setTwoid(int twoid) {
		this.twoid = twoid;
	}

	public int getTmid() {
		return tmid;
	}

	public void setTmid(int tmid) {
		this.tmid = tmid;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public List<T_MALL_IMAGE> getLimg() {
		return limg;
	}

	public void setLimg(List<T_MALL_IMAGE> limg) {
		this.limg = limg;
	}

}
