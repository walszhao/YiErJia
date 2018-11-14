package com.icss.yierjia.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.icss.yierjia.entity.Shop;

public class ShopDao extends BaseDao {
		/**
		 * 根据关键字查找店铺
		 * @param keyWords
		 * @return
		 * @throws Exception 
		 */
		public List<Shop> selectShopByKeyWords(String keyWords,int start) throws Exception{
			List<Shop> list=new ArrayList<Shop>();
			this.openConnection();
			String sql="select * from shop where (s_name like ? or s_desc like ?) and s_state=1 limit ?,12";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, "%"+keyWords+"%");
			pst.setString(2, "%"+keyWords+"%");
			pst.setInt(3, start);
			ResultSet rs=pst.executeQuery();
			while (rs.next()) {
				Shop shop=new Shop();
				shop.setSid(rs.getInt("s_id"));
				shop.setSname(rs.getString("s_name"));
				shop.setSusername(rs.getString("s_username"));
				shop.setSpwd(rs.getString("s_pwd"));
				shop.setSphone(rs.getString("s_phone"));
				shop.setSemail(rs.getString("s_email"));
				shop.setSdesc(rs.getString("s_desc"));
				shop.setSaddress(rs.getString("s_address"));
				shop.setSstate(rs.getString("s_state"));
				shop.setSimg(rs.getString("s_img"));
				list.add(shop);
			}
			rs.close();
			pst.close();
			return list;
		}
		/**
		 * 获取符合关键字的商家总条数
		 * @return
		 * @throws Exception
		 */
		public int getTotalCount(String keyWords) throws Exception{
			int totalCount=0;
			this.openConnection();
			String sql="select count(*) from shop where (s_name like ? or s_desc like ?) and s_state=1";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, "%"+keyWords+"%");
			pst.setString(2, "%"+keyWords+"%");
			ResultSet rs=pst.executeQuery();
			if (rs.next()) {
				totalCount=rs.getInt(1);
			}
			rs.close();
			pst.close();
			return totalCount;
		}
		
		/**
		 * 根据id查找商家信息
		 * @param sid
		 * @return
		 * @throws Exception
		 */
		public Shop selectBySid(int sid) throws Exception{
			Shop shop = null;
			openConnection();
			String sql = "select * from shop where s_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, sid);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				shop=new Shop();
				shop.setSid(rs.getInt("s_id"));
				shop.setSname(rs.getString("s_name"));
				shop.setSusername(rs.getString("s_username"));
				shop.setSpwd(rs.getString("s_pwd"));
				shop.setSphone(rs.getString("s_phone"));
				shop.setSemail(rs.getString("s_email"));
				shop.setSdesc(rs.getString("s_desc"));
				shop.setSaddress(rs.getString("s_address"));
				shop.setSstate(rs.getString("s_state"));
				shop.setSimg(rs.getString("s_img"));
			}
			rs.close();
			pst.close();
			return shop;
			
		}
		
		/**
		 * 查找指定状态的商家数量 1：正常 0：待审核
		 * @return
		 * @throws Exception
		 */
		public int selectShopCountByState(String state) throws Exception{
			openConnection();
			int count = 0;
			String sql = "select count(*) from shop where s_state=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, state);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
			pst.close();
			return count;
		}
		
		/**
		 * 分页查找指定状态商家列表 1：正常 0：待审核2：已删除
		 * @param state
		 * @return
		 * @throws Exception
		 */
		public List<Shop> selectShopsByState(String state,int firstResult,int maxResult) throws Exception{
			openConnection();
			Shop shop = null;
			List<Shop> list = new ArrayList<Shop>();
			String sql = "select * from shop where s_state=? limit ?,?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, state);
			pst.setInt(2, firstResult);
			pst.setInt(3, maxResult);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				shop=new Shop();
				shop.setSid(rs.getInt("s_id"));
				shop.setSname(rs.getString("s_name"));
				shop.setSusername(rs.getString("s_username"));
				shop.setSpwd(rs.getString("s_pwd"));
				shop.setSphone(rs.getString("s_phone"));
				shop.setSemail(rs.getString("s_email"));
				shop.setSdesc(rs.getString("s_desc"));
				shop.setSaddress(rs.getString("s_address"));
				shop.setSstate(rs.getString("s_state"));
				shop.setSimg(rs.getString("s_img"));
				list.add(shop);
			}
			rs.close();
			pst.close();
			return list;
		}
		
		/**
		 * 分页查找所有商家列表
		 * @param firstResult
		 * @param maxResult
		 * @return
		 * @throws Exception
		 */
		public List<Shop> selectAllShops(int firstResult,int maxResult) throws Exception{
			openConnection();
			Shop shop = null;
			List<Shop> list = new ArrayList<Shop>();
			String sql = "select * from shop limit ?,?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, firstResult);
			pst.setInt(2, maxResult);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				shop=new Shop();
				shop.setSid(rs.getInt("s_id"));
				shop.setSname(rs.getString("s_name"));
				shop.setSusername(rs.getString("s_username"));
				shop.setSpwd(rs.getString("s_pwd"));
				shop.setSphone(rs.getString("s_phone"));
				shop.setSemail(rs.getString("s_email"));
				shop.setSdesc(rs.getString("s_desc"));
				shop.setSaddress(rs.getString("s_address"));
				shop.setSstate(rs.getString("s_state"));
				shop.setSimg(rs.getString("s_img"));
				list.add(shop);
			}
			rs.close();
			pst.close();
			return list;
		}
		
		/**
		 * 查询所有商家列表
		 * @return
		 * @throws Exception
		 */
		public List<Shop> selectAllShops() throws Exception {
			List<Shop> list = new ArrayList<Shop>();
			openConnection();
			Shop shop = null;
			String sql = "select * from shop";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				shop=new Shop();
				shop.setSid(rs.getInt("s_id"));
				shop.setSname(rs.getString("s_name"));
				shop.setSusername(rs.getString("s_username"));
				shop.setSpwd(rs.getString("s_pwd"));
				shop.setSphone(rs.getString("s_phone"));
				shop.setSemail(rs.getString("s_email"));
				shop.setSdesc(rs.getString("s_desc"));
				shop.setSaddress(rs.getString("s_address"));
				shop.setSstate(rs.getString("s_state"));
				shop.setSimg(rs.getString("s_img"));
				list.add(shop);
			}
			rs.close();
			pst.close();
			return list;
		}
		
		/**
		 * 根据状态查找所有商家
		 * @param state
		 * @return
		 * @throws Exception
		 */
		public List<Shop> selectAllShopsByState(String state) throws Exception {
			openConnection();
			Shop shop = null;
			List<Shop> list = new ArrayList<Shop>();
			String sql = "select * from shop where s_state=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, state);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				shop=new Shop();
				shop.setSid(rs.getInt("s_id"));
				shop.setSname(rs.getString("s_name"));
				shop.setSusername(rs.getString("s_username"));
				shop.setSpwd(rs.getString("s_pwd"));
				shop.setSphone(rs.getString("s_phone"));
				shop.setSemail(rs.getString("s_email"));
				shop.setSdesc(rs.getString("s_desc"));
				shop.setSaddress(rs.getString("s_address"));
				shop.setSstate(rs.getString("s_state"));
				shop.setSimg(rs.getString("s_img"));
				list.add(shop);
			}
			rs.close();
			pst.close();
			return list;
		}
		
		/**
		 * 更改商家状态
		 * @param sid
		 * @param state
		 * @throws Exception 
		 */
		public void changeShopState(int sid,String state) throws Exception{
			this.openConnection();
			String sql="update shop set s_state=? where s_id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, state);
			pst.setInt(2, sid);
			pst.execute();
			pst.close();
		}
		
		/**
		 * 查找所有的商家数量 
		 * @return
		 * @throws Exception
		 */
		public int selectShopCount() throws Exception{
			openConnection();
			int count = 0;
			String sql = "select count(*) from shop";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
			pst.close();
			return count;
		}
		
}
