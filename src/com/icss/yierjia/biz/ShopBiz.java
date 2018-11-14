package com.icss.yierjia.biz;

import java.util.List;

import com.icss.yierjia.dao.ShopDao;
import com.icss.yierjia.entity.Shop;
import com.icss.yierjia.util.PageResult;

public class ShopBiz {
	/**
	 * 根据关键字查找店铺并分页显示
	 * @param keyWords
	 * @return
	 * @throws Exception 
	 */
	public void setPageResult(String keyWords,PageResult<Shop> pr) throws Exception{
		List<Shop> list=null;
		ShopDao sd=new ShopDao();
		//获取当前页
		int currentPage=pr.getCurrentPage();
		//计算本页开始条数
		int start=(currentPage-1)*12;
		try {
			//获取分页列表
			list=sd.selectShopByKeyWords(keyWords, start);
			pr.setList(list);
			
			//获取总条数
			int totalCount=sd.getTotalCount(keyWords);
			pr.setTotalCount(totalCount);
			
			//计算总页数
			int totalPage=totalCount%12==0?totalCount/12:totalCount/12+1;
			pr.setTotalPage(totalPage);
		} catch (Exception e) {
			throw e;
		}finally{
			sd.closeConnection();
		}
	}
	
	/**
	 * 根据sid查找商家信息
	 * @param sid
	 * @return
	 * @throws Exception
	 */
	public Shop findBySid(int sid) throws Exception{
		Shop shop = null;
		ShopDao dao = new ShopDao();
		try {
			shop = dao.selectBySid(sid);
		} catch (Exception e) {
			throw e;
		} finally{
			dao.closeConnection();
		}
		return shop;
	}
	
	/**
	 * 通过状态查询店铺列表  0未审核1审核通过2已删除3全部
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public List<Shop> findShopsByState(String state) throws Exception{
		List<Shop> list = null;
		ShopDao dao = new ShopDao();
		if (state.equals("3")) {
			list = dao.selectAllShops();
		}else{
			list = dao.selectAllShopsByState(state);
		}
		return list;
	}
	
	/**
	 * 查询所有商家并分页显示
	 * @return
	 * @throws Exception 
	 */
	public void shopList(PageResult<Shop> pr,int pageMax) throws Exception{
		ShopDao sd=new ShopDao();
		try {
			//获取当前页
			int currentPage=pr.getCurrentPage();
			//计算起始条数
			int start = (currentPage-1)*pageMax;
			//获取分页列表
			List<Shop> list=sd.selectAllShops(start,pageMax);
			pr.setList(list);
			
			//获取总条数
			int totalCount=sd.selectShopCount();
			pr.setTotalCount(totalCount);
			
			//计算总页数
			int totalPage=totalCount%pageMax==0?totalCount/pageMax:totalCount/pageMax+1;
			pr.setTotalPage(totalPage);
		} catch (Exception e) {
			throw e;
		}finally{
			sd.closeConnection();
		}
	}
	
	/**
	 * 查询指定状态商家并分页显示
	 * @return
	 * @throws Exception 
	 */
	public void shopStateList(PageResult<Shop> pr,int pageMax,String state) throws Exception{
		ShopDao sd=new ShopDao();
		try {
			//获取当前页
			int currentPage=pr.getCurrentPage();
			//计算起始条数
			int start = (currentPage-1)*pageMax;
			//获取分页列表
			List<Shop> list=sd.selectShopsByState(state,start,pageMax);
			pr.setList(list);
			
			//获取总条数
			int totalCount=sd.selectShopCountByState(state);
			pr.setTotalCount(totalCount);
			
			//计算总页数
			int totalPage=totalCount%pageMax==0?totalCount/pageMax:totalCount/pageMax+1;
			pr.setTotalPage(totalPage);
		} catch (Exception e) {
			throw e;
		}finally{
			sd.closeConnection();
		}
	}
	/**
	 * 更改商家状态
	 * @param sid
	 * @param state
	 * @throws Exception 
	 */
	public void changeShopState(int sid,String state) throws Exception{
		ShopDao sd=new ShopDao();
		try {
			sd.changeShopState(sid, state);
		} catch (Exception e) {
			throw e;
		}finally{
			sd.closeConnection();
		}
	}
}
