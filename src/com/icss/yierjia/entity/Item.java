package com.icss.yierjia.entity;

public class Item {
	private int iid;
	private int sid;
	private String itype;
	private String iname;
	private double currentprice;
	private double originalprice;
	private String idesc;
	private String iimg;
	private String istate; //0.ÔÚÊÛ  1.ÏÂ¼Ü
	
	
	public String getIstate() {
		return istate;
	}
	public void setIstate(String istate) {
		this.istate = istate;
	}
	public int getIid() {
		return iid;
	}
	public void setIid(int iid) {
		this.iid = iid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getItype() {
		return itype;
	}
	public void setItype(String itype) {
		this.itype = itype;
	}
	public String getIname() {
		return iname;
	}
	public void setIname(String iname) {
		this.iname = iname;
	}
	public double getCurrentprice() {
		return currentprice;
	}
	public void setCurrentprice(double currentprice) {
		this.currentprice = currentprice;
	}
	public String getIdesc() {
		return idesc;
	}
	public void setIdesc(String idesc) {
		this.idesc = idesc;
	}
	public double getOriginalprice() {
		return originalprice;
	}
	public void setOriginalprice(double originalprice) {
		this.originalprice = originalprice;
	}
	public String getIimg() {
		return iimg;
	}
	public void setIimg(String iimg) {
		this.iimg = iimg;
	}
	
	
}
