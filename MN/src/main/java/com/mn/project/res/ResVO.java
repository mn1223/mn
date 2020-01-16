package com.mn.project.res;

public class ResVO {
	private int pno;
	private String pDate;
	private String pLoc;
	private String pPrice;
	private String ubookmmid;
	
	
	public String getUbookmmid() {
		return ubookmmid;
	}
	public void setUbookmmid(String ubookmmid) {
		this.ubookmmid = ubookmmid;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public String getpLoc() {
		return pLoc;
	}
	public void setpLoc(String pLoc) {
		this.pLoc = pLoc;
	}
	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}
	@Override
	public String toString() {
		return "ResVO [pno=" + pno + ", pDate=" + pDate + ", pLoc=" + pLoc + ", pPrice=" + pPrice + ", ubookmmid="
				+ ubookmmid + "]";
	}
	
	
	
}
