package com.icss.yierjia.vo;

import java.util.Date;
import java.util.List;


public class OrderVo {
	private String oid;
	private int uid;
	private int sid;
	private Date odate;
	private String ostate;
	private String ocdes;
	private double oprice;
	private double ofcharge;
	private Date ocdate;
	private String address;
	private String name;
	private String phone;
	private List<OrderItemVo> orderItems;
	
	
	
	public List<OrderItemVo> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItemVo> orderItems) {
		this.orderItems = orderItems;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public String getOstate() {
		return ostate;
	}
	public void setOstate(String ostate) {
		this.ostate = ostate;
	}
	public String getOcdes() {
		return ocdes;
	}
	public void setOcdes(String ocdes) {
		this.ocdes = ocdes;
	}
	public double getOprice() {
		return oprice;
	}
	public void setOprice(double oprice) {
		this.oprice = oprice;
	}
	public double getOfcharge() {
		return ofcharge;
	}
	public void setOfcharge(double ofcharge) {
		this.ofcharge = ofcharge;
	}
	public Date getOcdate() {
		return ocdate;
	}
	public void setOcdate(Date ocdate) {
		this.ocdate = ocdate;
	}
}
