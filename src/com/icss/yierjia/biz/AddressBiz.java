package com.icss.yierjia.biz;

import java.util.List;

import com.icss.yierjia.dao.AddressDao;
import com.icss.yierjia.entity.Address;

public class AddressBiz {
	/**
	 * 添加地址的方法
	 * @param uid
	 * @param reciver
	 * @param phone
	 * @param province
	 * @param city
	 * @param area
	 * @param street
	 * @throws Exception 
	 */
	public void addAddress(int uid,String reciver,String phone,String province,String city,String area,String street) throws Exception {
		AddressDao ad=new AddressDao();
		try {
			ad.addAddress(uid, reciver, phone, province, city, area, street);
		} catch (Exception e) {
			throw e;
 		}finally{
 			ad.closeConnection();
 		}
	}
	/**
	 * 获取指定用户的所有地址
	 * @param uid
	 * @return
	 * @throws Exception 
	 */
	public List<Address> allAddress(int uid) throws Exception {
		List<Address> list=null;
		AddressDao ad=new AddressDao();
		try {
			list=ad.allAddress(uid);
		} catch (Exception e) {
			throw e;
		}finally{
			ad.closeConnection();
		}
		return list;
	}
}
