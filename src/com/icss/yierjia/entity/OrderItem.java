package com.icss.yierjia.entity;

public class OrderItem {
	private int oiid;
	private int iid;
	private String oid;
	private int icount;
	private double oiprice;
	
	public int getOiid() {
		return oiid;
	}
	public void setOiid(int oiid) {
		this.oiid = oiid;
	}
	public int getIid() {
		return iid;
	}
	public void setIid(int iid) {
		this.iid = iid;
	}
	
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getIcount() {
		return icount;
	}
	public void setIcount(int icount) {
		this.icount = icount;
	}
	public double getOiprice() {
		return oiprice;
	}
	public void setOiprice(double oiprice) {
		this.oiprice = oiprice;
	}
	
}
