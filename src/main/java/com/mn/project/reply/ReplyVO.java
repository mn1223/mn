package com.mn.project.reply;

import java.util.Date;

public class ReplyVO {
	private int bno;
	private int rno;
	private String contents;
	private String boremmid;
	private Date boreDate;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getBoremmid() {
		return boremmid;
	}
	public void setBoremmid(String boremmid) {
		this.boremmid = boremmid;
	}
	public Date getBoreDate() {
		return boreDate;
	}
	public void setBoreDate(Date boreDate) {
		this.boreDate = boreDate;
	}
	
	
	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", rno=" + rno + ", contents=" + contents + ", boremmid=" + boremmid
				+ ", boreDate=" + boreDate + "]";
	}
	
	
}
