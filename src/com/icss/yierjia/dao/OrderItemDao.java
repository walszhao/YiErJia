package com.icss.yierjia.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.icss.yierjia.vo.OrderItemVo;

public class OrderItemDao extends BaseDao{
	
	/**
	 * 生成订单项
	 * @throws Exception
	 */
	public void addOrderTerm(int iid,String oid,int icount,double oiprice) throws Exception {
		this.openConnection();
		String sql="insert into order_item (i_id,o_id,i_count,o_i_price) values(?,?,?,?)";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, iid);
		pst.setString(2, oid);
		pst.setInt(3, icount);
		pst.setDouble(4, oiprice);
		pst.execute();
		pst.close();
	}
	
	/**
	 * 根据订单号获取订单项(OrderItemVo)
	 * @param oid
	 * @return
	 * @throws Exception
	 */
	public List<OrderItemVo> selectByOid(String oid) throws Exception{
		openConnection();
		List<OrderItemVo> list = new ArrayList<OrderItemVo>();
		OrderItemVo orderItem = null;
		String sql = "select t1.*,t2.i_count from item t1,order_item t2 where t2.i_id = t1.i_id and o_id = ?;";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, oid);
		ResultSet rs = pst.executeQuery();
		while(rs.next()){
			orderItem = new OrderItemVo();
			orderItem.setIid(rs.getInt("i_id"));
			orderItem.setSid(rs.getInt("s_id"));
			orderItem.setItype(rs.getString("i_type"));
			orderItem.setIname(rs.getString("i_name"));
			orderItem.setCurrentprice(rs.getDouble("current_price"));
			orderItem.setIdesc(rs.getString("i_desc"));
			orderItem.setOriginalprice(rs.getDouble("original_price"));
			orderItem.setIimg(rs.getString("i_img"));
			orderItem.setIcount(rs.getInt("i_count"));
			list.add(orderItem);
		}
		rs.close();
		pst.close();
		return list;
	}
	
}
