package com.mn.project.resmanager;

import java.util.Date;

public class ResManagerVO {
	private String mmname;
	private String mmid;
	private String mmgender;
	private String mmphonenum;
	private Date mmdate;
	private String mmgrade;
	
	
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

	public Date getMmdate() {
		return mmdate;
	}

	public void setMmdate(Date mmdate) {
		this.mmdate = mmdate;
	}

	public String getMmgrade() {
		return mmgrade;
	}

	public void setMmgrade(String mmgrade) {
		this.mmgrade = mmgrade;
	}

	@Override
	public String toString() {
		return "ResManagerVO [mmname=" + mmname + ", mmid=" + mmid + ", mmgender=" + mmgender + ", mmphonenum="
				+ mmphonenum + ", mmdate=" + mmdate + ", mmgrade=" + mmgrade + "]";
	}	
	
}
