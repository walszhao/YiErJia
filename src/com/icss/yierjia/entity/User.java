package com.icss.yierjia.entity;

public class User {
	private int uid;
	private String uusername;
	private String uimg;
	private String urealname;
	private String upwd;
	private String uphone;
	private String uemail;
	private String uaddress;
	private String upaypwd;
	private double ubalance;
	private String ustate;	//0.未审核  1.审核通过
	private String urole;	//0.普通用户   1.管理员
	private String ucode;
	
	
	public String getUpaypwd() {
		return upaypwd;
	}
	public void setUpaypwd(String upaypwd) {
		this.upaypwd = upaypwd;
	}
	public String getUimg() {
		return uimg;
	}
	public void setUimg(String uimg) {
		this.uimg = uimg;
	}
	
	public String getUcode() {
		return ucode;
	}
	public void setUcode(String ucode) {
		this.ucode = ucode;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUusername() {
		return uusername;
	}
	public void setUusername(String uusername) {
		this.uusername = uusername;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUrealname() {
		return urealname;
	}
	public void setUrealname(String urealname) {
		this.urealname = urealname;
	}
	public String getUphone() {
		return uphone;
	}
	public void setUphone(String uphone) {
		this.uphone = uphone;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public String getUstate() {
		return ustate;
	}
	public void setUstate(String ustate) {
		this.ustate = ustate;
	}

	public double getUbalance() {
		return ubalance;
	}
	public void setUbalance(double ubalance) {
		this.ubalance = ubalance;
	}
	public String getUrole() {
		return urole;
	}
	public void setUrole(String urole) {
		this.urole = urole;
	}
	
	
	
}
