package com.mn.project.board;

import java.util.Date;

//CREATE TABLE BOARD(
//		  BOMANAGENUM NUMBER(1) NOT NULL,
//		  BNO NUMBER(4) PRIMARY KEY,
//		  TITLE NVARCHAR2(50) NOT NULL,
//		  CONTENTS NVARCHAR2(500) NOT NULL,
//		  BOMMID NVARCHAR2(20) NOT NULL,
//		  BODATE  DATE DEFAULT SYSDATE,
//		  VIEWCNT NUMBER(4) NOT NULL,
//		  FILESTATUS NUMBER(1) NULL,
public class BoardVO {
	private int boManageNum;
	private int bno;
	private String title;
	private String contents;
	private String bommid;
	private Date boDate;
	private int viewCnt;
	private int fileStatus;	
	private int rNum;
	
	
	
	
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getBoManageNum() {
		return boManageNum;
	}
	public void setBoManageNum(int boManageNum) {
		this.boManageNum = boManageNum;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getBommid() {
		return bommid;
	}
	public void setBommid(String bommid) {
		this.bommid = bommid;
	}
	public Date getBoDate() {
		return boDate;
	}
	public void setBoDate(Date boDate) {
		this.boDate = boDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getFileStatus() {
		return fileStatus;
	}
	public void setFileStatus(int fileStatus) {
		this.fileStatus = fileStatus;
	}	
	
	@Override
	public String toString() {
		return "BoardVO [boManageNum=" + boManageNum + ", bno=" + bno + ", title=" + title + ", contents=" + contents
				+ ", bommid=" + bommid + ", boDate=" + boDate + ", viewCnt=" + viewCnt + ", fileStatus=" + fileStatus
				+ "]";
	}
	
	
}
