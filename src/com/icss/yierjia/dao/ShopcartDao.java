package com.icss.yierjia.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ShopcartDao extends RedisDao{
	
	/**
	 * 向购物车添加商品
	 * @param uid
	 * @param iid
	 * @param iname
	 * @param iprice
	 * @param iimg
	 * @param icount
	 */
	public void addToShopcart(int uid,String iid,String iname,String iprice,String iimg,String icount){
		openRedis();
		if (jedis.exists("shopcart"+Integer.toString(uid))) {
			if (jedis.hexists("shopcart"+Integer.toString(uid), iid)) {
				List<String> itemDetailList=jedis.hmget("shopcart"+uid, iid);
				String itemDetail=itemDetailList.get(0);
				String[] itemDetailStr=itemDetail.split(",");
				String count=itemDetailStr[3];
				int finalcount=Integer.parseInt(count)+Integer.parseInt(icount);
				itemDetailStr[3]=Integer.toString(finalcount);
				String strItemDetail=itemDetailStr[0]+","+itemDetailStr[1]+","+itemDetailStr[2]+","+itemDetailStr[3];
				jedis.hset("shopcart"+uid, iid, strItemDetail);
			}else {
				Map<String, String> map=new HashMap<String,String>();
				map.put(iid, iname+","+iprice+","+iimg+","+icount);
				jedis.hmset("shopcart"+uid, map);
			}
			
		}else {
			Map<String, String> map=new HashMap<String,String>();
			map.put(iid, iname+","+iprice+","+iimg+","+icount);
			jedis.hmset("shopcart"+uid, map);
		}
		
	}
	/**
	 * 返回指定用户购物车的所有商品
	 * @param uid
	 * @return
	 */
	public List<String > shopcartList(int uid) {
		openRedis();
		List<String> list=new ArrayList<String>();
		Iterator<String> ite=jedis.hkeys("shopcart"+Integer.toString(uid)).iterator();
		while (ite.hasNext()) {
			String key=ite.next();
			list.add(key+","+jedis.hmget("shopcart"+uid,key));
		}
		return list;
	}
	/**
	 * 用户修改购物车指定商品数量
	 * @param uid
	 * @param iid
	 * @param icount
	 */
	public void updateShopcartCount(int uid,String iid,String icount) {
		openRedis();
		List<String> itemDetailList=jedis.hmget("shopcart"+uid, iid);
		String itemDetail=itemDetailList.get(0);
		String[] itemDetailStr=itemDetail.split(",");
		itemDetailStr[3]=icount;
		String strItemDetail=itemDetailStr[0]+","+itemDetailStr[1]+","+itemDetailStr[2]+","+itemDetailStr[3];
		jedis.hset("shopcart"+uid, iid, strItemDetail);
	}
	/**
	 * 删除用户指定的商品
	 * @param uid
	 * @param iid
	 */
	public void deleteShopcartItem(int uid,String iid){
		openRedis();
		jedis.hdel("shopcart"+uid, iid);
	}
	
	/**
	 * 获取购物车选中商品信息
	 * @param uid
	 * @param ids
	 * @return
	 */
	public List<String> shopcartSelectedList(int uid, String[] ids) {
		openRedis();
		List<String> list = new ArrayList<String>();
		String shopcartName = "shopcart" + Integer.toString(uid);
		for (String id:ids) {
			List<String> itemArr = jedis.hmget(shopcartName,id);
			String item = itemArr.get(0);
			item = id + "," + item;
			list.add(item);
		}
		return list;
	}
}
