package com.icss.yierjia.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.icss.yierjia.entity.Item;

public class ItemDao extends BaseDao{
	/**
	 * 查找所有食品 
	 * @return
	 * @throws Exception 
	 */
	public List<Item> findFood() throws Exception{
		List<Item> list=new ArrayList<Item>();
		this.openConnection();
		String sql="select * from item where i_state=0 and i_type like '%食品%'";
		PreparedStatement pst=conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		while(rs.next()){
			Item item=new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	/**
	 * 查找所有服装
	 * @return
	 * @throws Exception
	 */
	public List<Item> findClothes() throws Exception{
		List<Item> list=new ArrayList<Item>();
		this.openConnection();
		String sql="select * from item where i_state=0 and i_type like '%服装%'";
		PreparedStatement pst=conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		while(rs.next()){
			Item item=new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	/**
	 * 查找所有数码产品
	 * @return
	 * @throws Exception
	 */
	public List<Item> findDigital() throws Exception{
		List<Item> list=new ArrayList<Item>();
		this.openConnection();
		String sql="select * from item where i_state=0 and i_type like '%数码%'";
		PreparedStatement pst=conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		while(rs.next()){
			Item item=new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	/**
	 * 查找前指定个数的食品 
	 * @return
	 * @throws Exception 
	 */
	public List<Item> findFoodTopN(int n) throws Exception{
		List<Item> list=new ArrayList<Item>();
		this.openConnection();
		String sql="select * from item where i_state=0 and i_type like '%食品%' limit 0,?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, n);
		ResultSet rs=pst.executeQuery();
		while(rs.next()){
			Item item=new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	/**
	 * 查找前指定个数服装
	 * @return
	 * @throws Exception
	 */
	public List<Item> findClothesTopN(int n) throws Exception{
		List<Item> list=new ArrayList<Item>();
		this.openConnection();
		String sql="select * from item where i_state=0 and i_type like '%服装%' limit 0,?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, n);
		ResultSet rs=pst.executeQuery();
		while(rs.next()){
			Item item=new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	/**
	 * 查找前指定个数数码产品
	 * @return
	 * @throws Exception
	 */
	public List<Item> findDigitalTopN(int n) throws Exception{
		List<Item> list=new ArrayList<Item>();
		this.openConnection();
		String sql="select * from item where i_state=0 and i_type like '%数码%' limit 0,?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, n);
		ResultSet rs=pst.executeQuery();
		while(rs.next()){
			Item item=new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	
	/**
	 * 根据关键字查找商品
	 * @param keyWords
	 * @return
	 * @throws Exception 
	 */
	public List<Item> selectItemByKeyWords(String keyWords,int start) throws Exception{
		List<Item> list=new ArrayList<Item>();
		this.openConnection();
		String sql="select * from item where i_state=0 and (i_name like ? or i_desc like ? or i_type like ?) limit ?,12";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, "%"+keyWords+"%");
		pst.setString(2, "%"+keyWords+"%");
		pst.setString(3, "%"+keyWords+"%");
		pst.setInt(4, start);
		ResultSet rs=pst.executeQuery();
		while (rs.next()) {
			Item item=new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	/**
	 * 获取符合关键字的商品总条数
	 * @return
	 * @throws Exception
	 */
	public int getTotalCount(String keyWords) throws Exception{
		int totalCount=0;
		this.openConnection();
		String sql="select count(*) from item where i_state=0 and (i_name like ? or i_desc like ? or i_type like ?)";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, "%"+keyWords+"%");
		pst.setString(2, "%"+keyWords+"%");
		pst.setString(3, "%"+keyWords+"%");
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			totalCount=rs.getInt(1);
		}
		rs.close();
		pst.close();
		return totalCount;
	}
	/**
	 * 根据商品id查询商品
	 * @param iid
	 * @return
	 * @throws Exception 
	 */
	public Item selectItemById(int iid) throws Exception{
		Item item=null;
		this.openConnection();
		String sql="select * from item where i_id=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, iid);
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			item=new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
		}
		rs.close();
		pst.close();
		return item;
	}
	
	/**
	 * 根据类别查找商品
	 * @param keyWords
	 * @return
	 * @throws Exception 
	 */
	public List<Item> selectItemByType(String type,int start) throws Exception{
		List<Item> list=new ArrayList<Item>();
		this.openConnection();
		String sql="select * from item where i_state=0 and i_type like ? limit ?,12";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, "%"+type+"%");
		pst.setInt(2, start);
		ResultSet rs=pst.executeQuery();
		while (rs.next()) {
			Item item=new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	/**
	 * 获取相关类型的商品总条数
	 * @return
	 * @throws Exception
	 */
	public int getTypeTotalCount(String type) throws Exception{
		int totalCount=0;
		this.openConnection();
		String sql="select count(*) from item where i_state=0 and i_type like ?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, "%"+type+"%");
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			totalCount=rs.getInt(1);
		}
		rs.close();
		pst.close();
		return totalCount;
	}
	
	/**
	 * 通过商家id查找商品信息
	 * @param sid
	 * @return
	 * @throws Exception
	 */
	public List<Item> pageItemsBySid(int sid,int firstResult,int maxResult) throws Exception{
		List<Item> list = new ArrayList<Item>();
		Item item = null;
		openConnection();
		String sql = "select * from item where s_id=? limit ?,?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, sid);
		pst.setInt(2, firstResult);
		pst.setInt(3, maxResult);
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			item = new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	
	/**
	 * 通过商家id查找商品总数
	 * @param sid
	 * @return
	 * @throws Exception
	 */
	public int selectCountBySid(int sid) throws Exception{
		int count  = 0;
		openConnection();
		String sql = "select count(*) from item where s_id=?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, sid);
		ResultSet rs = pst.executeQuery();
		if (rs.next()) {
			count = rs.getInt(1);
		}
		rs.close();
		pst.close();
		return count;
	}
	
	/**
	 * 查找所有商品
	 * @return
	 * @throws Exception
	 */
	public List<Item> selectAllItems() throws Exception{
		openConnection();
		List<Item> list = new ArrayList<Item>();
		Item item = null;
		String sql = "select * from item";
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			item = new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	
	/**
	 * 通过状态查找商品
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public List<Item> selectItemsByState(String state) throws Exception{
		openConnection();
		List<Item> list = new ArrayList<Item>();
		Item item = null;
		String sql = "select * from item where i_state=?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, state);
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			item = new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	
	/**
	 * 分页查找所有商品
	 * @return
	 * @throws Exception
	 */
	public List<Item> selectAllItems(int start,int pageMax) throws Exception{
		openConnection();
		List<Item> list = new ArrayList<Item>();
		Item item = null;
		String sql = "select * from item limit ?,?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, start);
		pst.setInt(2, pageMax);
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			item = new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	/**
	 * 获取所有商品总数
	 * @return
	 * @throws Exception
	 */
	public int selectItemCount() throws Exception {
		int totalCount=0;
		this.openConnection();
		String sql="select count(*) from item";
		PreparedStatement pst=conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			totalCount=rs.getInt(1);
		}
		rs.close();
		pst.close();
		return totalCount;
		
	}
	/**
	 * 通过状态查找商品
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public List<Item> selectItemsByState(String state,int start,int pageMax) throws Exception{
		openConnection();
		List<Item> list = new ArrayList<Item>();
		Item item = null;
		String sql = "select * from item where i_state=? limit ?,?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, state);
		pst.setInt(2,start);
		pst.setInt(3, pageMax);
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			item = new Item();
			item.setIid(rs.getInt("i_id"));
			item.setSid(rs.getInt("s_id"));
			item.setIname(rs.getString("i_name"));
			item.setItype(rs.getString("i_type"));
			item.setCurrentprice(rs.getDouble("current_price"));
			item.setOriginalprice(rs.getDouble("original_price"));
			item.setIdesc(rs.getString("i_desc"));
			item.setIimg(rs.getString("i_img"));
			item.setIstate(rs.getString("i_state"));
			list.add(item);
		}
		rs.close();
		pst.close();
		return list;
	}
	/**
	 * 获取指定状态商品总数
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public int selectItemCountByState(String state) throws Exception {
		int totalCount=0;
		this.openConnection();
		String sql="select count(*) from item where i_state=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, state);
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			totalCount=rs.getInt(1);
		}
		rs.close();
		pst.close();
		return totalCount;
		
	}
	/**
	 * 修改商品状态
	 * @param parseInt
	 * @param state
	 * @throws Exception 
	 */
	public void changeItemState(int iid, String state) throws Exception {
		this.openConnection();
		String sql="update item set i_state=? where i_id=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, state);
		pst.setInt(2,iid);
		pst.execute();
		pst.close();
	}

}

