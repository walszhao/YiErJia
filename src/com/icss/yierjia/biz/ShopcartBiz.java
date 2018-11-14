package com.icss.yierjia.biz;

import java.util.List;

import com.icss.yierjia.dao.ShopcartDao;

public class ShopcartBiz {
	/**
	 * 购物车添加商品
	 * @param uid
	 * @param iid
	 * @param iname
	 * @param iprice
	 * @param iimg
	 * @param icount
	 */
	public void addToShopcart(int uid,String iid,String iname,String iprice,String iimg,String icount){
		ShopcartDao sd=new ShopcartDao();
		sd.addToShopcart(uid, iid, iname, iprice, iimg, icount);
	}
	/**
	 * 返回指定用户购物车所有商品
	 * @param uid
	 * @return
	 */
	public List<String > shopcartList(int uid) {
		List<String> list=null;
		ShopcartDao sd=new ShopcartDao();
		list=sd.shopcartList(uid);
		return list;
	}
	
	/**
	 * 获取购物车选中商品信息
	 * @param uid
	 * @param ids
	 * @return
	 */
	public List<String> shopcartSelectedList(int uid,String[] ids){
		List<String> list=null;
		ShopcartDao dao = new ShopcartDao();
		list = dao.shopcartSelectedList(uid,ids);
		return list;
	}
	/**
	 * 用户修改购物车指定商品数量
	 * @param uid
	 * @param iid
	 * @param icount
	 */
	public void updateShopcartCount(int uid,String iid,String icount) {
		ShopcartDao sd=new ShopcartDao();
		sd.updateShopcartCount(uid, iid, icount);
	}
	/**
	 * 删除用户指定的商品
	 * @param uid
	 * @param iid
	 */
	public void deleteShopcartItem(int uid,String iid){
		ShopcartDao sd=new ShopcartDao();
		sd.deleteShopcartItem(uid, iid);
	}
}
