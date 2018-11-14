package com.icss.yierjia.util;

public class Count {
	
	private int userCount;				//正常用户
	private int deletedUserCount;		//已删除用户
	private int shopCount;				//正常商家
	private int unactivatedShopCount;	//待审核商家
	private int orderCount;				//订单
	private int adminCount;				//管理员
	
	public int getUserCount() {
		return userCount;
	}
	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}
	public int getDeletedUserCount() {
		return deletedUserCount;
	}
	public void setDeletedUserCount(int deletedUserCount) {
		this.deletedUserCount = deletedUserCount;
	}
	public int getShopCount() {
		return shopCount;
	}
	public void setShopCount(int shopCount) {
		this.shopCount = shopCount;
	}
	public int getUnactivatedShopCount() {
		return unactivatedShopCount;
	}
	public void setUnactivatedShopCount(int unactivatedShopCount) {
		this.unactivatedShopCount = unactivatedShopCount;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getAdminCount() {
		return adminCount;
	}
	public void setAdminCount(int adminCount) {
		this.adminCount = adminCount;
	}
	
	
}
