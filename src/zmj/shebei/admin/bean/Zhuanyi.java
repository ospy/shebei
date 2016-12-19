package zmj.shebei.admin.bean;

import java.sql.Date;

public class Zhuanyi {
	int id;
	int sbid;
	int oldkeshi;
	int newkeshi;
	String pizhunren;
	Date diaobodate;
	String beizhu;
	String newdidian;
	String olddidian;
	public Zhuanyi() {
		super();
	}
	public Zhuanyi(int id, int sbid, int oldkeshi, int newkeshi,
			String pizhunren, Date tiaobodate, String beizhu, String newdidian,String olddidian) {
		super();
		this.id = id;
		this.sbid = sbid;
		this.oldkeshi = oldkeshi;
		this.newkeshi = newkeshi;
		this.pizhunren = pizhunren;
		this.diaobodate = tiaobodate;
		this.beizhu = beizhu;
		this.newdidian = newdidian;
		this.olddidian = olddidian;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSbid() {
		return sbid;
	}
	public void setSbid(int sbid) {
		this.sbid = sbid;
	}
	public int getOldkeshi() {
		return oldkeshi;
	}
	public void setOldkeshi(int oldkeshi) {
		this.oldkeshi = oldkeshi;
	}
	public int getNewkeshi() {
		return newkeshi;
	}
	public void setNewkeshi(int newkeshi) {
		this.newkeshi = newkeshi;
	}
	public String getPizhunren() {
		return pizhunren;
	}
	public void setPizhunren(String pizhunren) {
		this.pizhunren = pizhunren;
	}
	public Date getDiaobodate() {
		return diaobodate;
	}
	public void setDiaobodate(Date tiaobodate) {
		this.diaobodate = tiaobodate;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public String getNewdidian() {
		return newdidian;
	}
	public void setNewdidian(String newdidian) {
		this.newdidian = newdidian;
	}
	public String getOlddidian() {
		return olddidian;
	}
	public void setOlddidian(String olddidian) {
		this.olddidian = olddidian;
	}
}
