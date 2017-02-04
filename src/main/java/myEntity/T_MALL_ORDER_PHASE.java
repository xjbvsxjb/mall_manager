package myEntity;

import java.util.Date;

public class T_MALL_ORDER_PHASE {
	private int id;
	private int phase_no;
	private String phase_comment;
	private Date phase_time;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPhase_no() {
		return phase_no;
	}

	public void setPhase_no(int phase_no) {
		this.phase_no = phase_no;
	}

	public String getPhase_comment() {
		return phase_comment;
	}

	public void setPhase_comment(String phase_comment) {
		this.phase_comment = phase_comment;
	}

	public Date getPhase_time() {
		return phase_time;
	}

	public void setPhase_time(Date phase_time) {
		this.phase_time = phase_time;
	}

}
