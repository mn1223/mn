package com.mn.project.resmanager;

public class PartyReservationVO {
	private String mmname;
	private String mmid;
	private String pdate;
	private String mmgender;
	private String mmphonenum;
	private String ubookstatus;
	private String ubookdeposit;
	
	public String getMmname() {
		return mmname;
	}
	public void setMmname(String mmname) {
		this.mmname = mmname;
	}
	public String getMmid() {
		return mmid;
	}
	public void setMmid(String mmid) {
		this.mmid = mmid;
	}
	
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getMmgender() {
		return mmgender;
	}
	public void setMmgender(String mmgender) {
		this.mmgender = mmgender;
	}
	public String getMmphonenum() {
		return mmphonenum;
	}
	public void setMmphonenum(String mmphonenum) {
		this.mmphonenum = mmphonenum;
	}
	public String getUbookstatus() {
		return ubookstatus;
	}
	public void setUbookstatus(String ubookstatus) {
		this.ubookstatus = ubookstatus;
	}
	public String getUbookdeposit() {
		return ubookdeposit;
	}
	public void setUbookdeposit(String ubookdeposit) {
		this.ubookdeposit = ubookdeposit;
	}
	@Override
	public String toString() {
		return "PartyReservationVO [mmname=" + mmname + ", mmid=" + mmid + ", pdate=" + pdate
				+ ", mmgender=" + mmgender + ", mmphonenum=" + mmphonenum + ", ubookstatus=" + ubookstatus
				+ ", ubookdeposit=" + ubookdeposit + "]";
	}


	
}
