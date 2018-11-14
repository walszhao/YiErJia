package com.icss.yierjia.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.icss.yierjia.entity.Address;

public class AddressDao extends BaseDao{
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
		this.openConnection();
		String sql="insert into address set u_id=?,name=?,phone=?,province=?,city=?,area=?,street=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, uid);
		pst.setString(2, reciver);
		pst.setString(3, phone);
		pst.setString(4, province);
		pst.setString(5, city);
		pst.setString(6, area);
		pst.setString(7, street);
		pst.execute();
		pst.close();
	}
	/**
	 * 获取指定用户的所有地址
	 * @param uid
	 * @return
	 * @throws Exception 
	 */
	public List<Address> allAddress(int uid) throws Exception {
		List<Address> list=new ArrayList<Address>();
		this.openConnection();
		String sql="select * from address where u_id=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, uid);
		ResultSet rs=pst.executeQuery();
		while (rs.next()) {
			Address a=new Address();
			a.setUid(rs.getInt("u_id"));
			a.setName(rs.getString("name"));
			a.setPhone(rs.getString("phone"));
			a.setProvince(rs.getString("province"));
			a.setCity(rs.getString("city"));
			a.setStreet(rs.getString("street"));
			a.setArea(rs.getString("area"));
			list.add(a);
		}
		rs.close();
		pst.close();
		return list;
	}
}
