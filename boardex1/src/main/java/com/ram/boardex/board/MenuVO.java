package com.ram.boardex.board;

public class MenuVO {
	private int mno;
	private String code;
	private String codename;
	private int sort_num;
	private String comments;
	private String reg_id;
	private String reg_dt;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodename() {
		return codename;
	}
	public void setCodename(String codename) {
		this.codename = codename;
	}
	public int getSort_num() {
		return sort_num;
	}
	public void setSort_num(int sort_num) {
		this.sort_num = sort_num;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	
	@Override
	public String toString() {
		return "MenuVO [mno=" + mno + ", code=" + code + ", codename=" + codename + ", sort_num=" + sort_num
				+ ", comments=" + comments + ", reg_id=" + reg_id + ", reg_dt=" + reg_dt + "]";
	}
	
	
	
	
	

}
