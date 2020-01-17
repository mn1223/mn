package com.mn.project.login;

public class LoginVO {

    String mmname;
    String mmid;
    String mmpwd;
    String re_mmpwd;
    String mmphonenum;
    String mmgender;
    String mmdate;
    String mmq;
    String mma;
    String mmgrade;
    
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
	public String getMmpwd() {
		return mmpwd;
	}
	public void setMmpwd(String mmpwd) {
		this.mmpwd = mmpwd;
	}
	public String getRe_mmpwd() {
		return re_mmpwd;
	}
	public void setRe_mmpwd(String re_mmpwd) {
		this.re_mmpwd = re_mmpwd;
	}
	public String getMmphonenum() {
		return mmphonenum;
	}
	public void setMmphonenum(String mmphonenum) {
		this.mmphonenum = mmphonenum;
	}
	public String getMmgender() {
		return mmgender;
	}
	public void setMmgender(String mmgender) {
		this.mmgender = mmgender;
	}
	public String getMmdate() {
		return mmdate;
	}
	public void setMmdate(String mmdate) {
		this.mmdate = mmdate;
	}
	public String getMmq() {
		return mmq;
	}
	public void setMmq(String mmq) {
		this.mmq = mmq;
	}
	public String getMma() {
		return mma;
	}
	public void setMma(String mma) {
		this.mma = mma;
	}
	public String getMmgrade() {
		return mmgrade;
	}
	public void setMmgrade(String mmgrade) {
		this.mmgrade = mmgrade;
	}
	
	@Override
	public String toString() {
		return "LoginVO [mmname=" + mmname + ", mmid=" + mmid + ", mmpwd=" + mmpwd + ", re_mmpwd=" + re_mmpwd
				+ ", mmphonenum=" + mmphonenum + ", mmgender=" + mmgender + ", mmdate=" + mmdate + ", mmq=" + mmq
				+ ", mma=" + mma + ", mmgrade=" + mmgrade + "]";
	}
    
}
