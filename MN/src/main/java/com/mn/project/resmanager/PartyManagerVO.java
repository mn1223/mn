package com.mn.project.resmanager;

public class PartyManagerVO {	
	private int pno;
	private String pDate;
	private int pCnt;
	private int pPrice;
	private String pLoc;
	
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
	public int getpCnt() {
		return pCnt;
	}
	public void setpCnt(int pCnt) {
		this.pCnt = pCnt;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpLoc() {
		return pLoc;
	}
	public void setpLoc(String pLoc) {
		this.pLoc = pLoc;
	}
	@Override
	public String toString() {
		return "PartyManagerVO [pno=" + pno + ", pDate=" + pDate + ", pCnt=" + pCnt + ", pPrice=" + pPrice + ", pLoc="
				+ pLoc + "]";
	}
	
	
	
	
}
