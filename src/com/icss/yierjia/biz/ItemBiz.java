package com.icss.yierjia.biz;

import java.util.List;

import com.icss.yierjia.dao.ItemDao;
import com.icss.yierjia.entity.Item;
import com.icss.yierjia.util.IndexList;
import com.icss.yierjia.util.PageResult;

public class ItemBiz {
	/**
	 * 查找所有食品 
	 * @return
	 * @throws Exception 
	 */
	public void setIndexList(IndexList il) throws Exception{
		ItemDao id=new ItemDao();
		try {
			List<Item> foodlist=id.findFoodTopN(7);
			il.setFoodList(foodlist);
			
			List<Item> clothesList=id.findClothesTopN(9);
			il.setClothesList(clothesList);
			
			List<Item> digitalList=id.findDigitalTopN(12);
			il.setDigitalList(digitalList);
		} catch (Exception e) {
			throw e;
		}finally{
			id.closeConnection();
		}
	}
	/**
	 * 根据关键字查找商品并分页显示
	 * @param keyWords
	 * @return
	 * @throws Exception 
	 */
	public void setPageResult(String keyWords,PageResult<Item> pr) throws Exception{
		List<Item> list=null;
		ItemDao id=new ItemDao();
		//获取当前页
		int currentPage=pr.getCurrentPage();
		//计算本页开始条数
		int start=(currentPage-1)*12;
		try {
			//获取分页列表
			list=id.selectItemByKeyWords(keyWords, start);
			pr.setList(list);
			
			//获取总条数
			int totalCount=id.getTotalCount(keyWords);
			pr.setTotalCount(totalCount);
			
			//计算总页数
			int totalPage=totalCount%12==0?totalCount/12:totalCount/12+1;
			pr.setTotalPage(totalPage);
		} catch (Exception e) {
			throw e;
		}finally{
			id.closeConnection();
		}
	}
	/**
	 * 根据商品id查询商品
	 * @param iid
	 * @return
	 * @throws Exception 
	 */
	public Item selectItemById(int iid) throws Exception{
		Item item=null;
		ItemDao id=new ItemDao();
		try {
			item=id.selectItemById(iid);
		} catch (Exception e) {
			throw e;
		}finally{
			id.closeConnection();
		}
		return item;
	}
	
	/**
	 * 根据种类查找商品并分页显示
	 * @param type
	 * @param pr
	 * @throws Exception
	 */
	public void searchItemsByType(String type,PageResult<Item> pr) throws Exception{
		List<Item> list=null;
		ItemDao id=new ItemDao();
		//获取当前页
		int currentPage=pr.getCurrentPage();
		//计算本页开始条数
		int start=(currentPage-1)*12;
		try {
			//获取分页列表
			list=id.selectItemByType(type, start);
			pr.setList(list);
			
			//获取总条数
			int totalCount=id.getTypeTotalCount(type);
			pr.setTotalCount(totalCount);
			
			//计算总页数
			int totalPage=totalCount%12==0?totalCount/12:totalCount/12+1;
			pr.setTotalPage(totalPage);
		} catch (Exception e) {
			throw e;
		}finally{
			id.closeConnection();
		}
	}
	
	public void setPageResultBySid(int sid,PageResult<Item> page) throws Exception{
		ItemDao dao = new ItemDao();
		//每页显示9条
		int maxResult = 9;
		//从第几条开始查找
		int currentPage = page.getCurrentPage();
		int firstResult = (currentPage - 1) * maxResult;
		try {
			//查找商品列表,添加到page
			List<Item> list = dao.pageItemsBySid(sid,firstResult,maxResult);
			page.setList(list);
			//查找总条数
			int count = dao.selectCountBySid(sid);
			page.setTotalCount(count);
			//求出总页数
			int totalPage = count%maxResult==0?count/maxResult:count/maxResult+1;
			page.setTotalPage(totalPage);
			
		} catch (Exception e) {
			throw e;
		}finally{
			dao.closeConnection();
		}
		
	}
	/**
	 * 通过状态查找商品列表0上架1下架2所有
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public List<Item> findItemsByState(String state) throws Exception{
		List<Item> list = null;
		ItemDao dao = new ItemDao();
		try {
			if (state.equals("2")) {
				list = dao.selectAllItems();
			}else {
				list = dao.selectItemsByState(state);
			}
			
		} catch (Exception e) {
			throw e;
		} finally{
			dao.closeConnection();
		}
		return list;
	}
	
	/**
	 * 查询所有商家并分页显示
	 * @return
	 * @throws Exception 
	 */
	public void itemList(PageResult<Item> pr,int pageMax) throws Exception{
		ItemDao id=new ItemDao();
		try {
			//获取当前页
			int currentPage=pr.getCurrentPage();
			//计算起始条数
			int start = (currentPage-1)*pageMax;
			//获取分页列表
			List<Item> list=id.selectAllItems(start,pageMax);
			pr.setList(list);
			
			//获取总条数
			int totalCount=id.selectItemCount();
			pr.setTotalCount(totalCount);
			
			//计算总页数
			int totalPage=totalCount%pageMax==0?totalCount/pageMax:totalCount/pageMax+1;
			pr.setTotalPage(totalPage);
		} catch (Exception e) {
			throw e;
		}finally{
			id.closeConnection();
		}
	}
	
	/**
	 * 查询指定状态商家并分页显示
	 * @return
	 * @throws Exception 
	 */
	public void itemStateList(PageResult<Item> pr,int pageMax,String state) throws Exception{
		ItemDao id=new ItemDao();
		try {
			//获取当前页
			int currentPage=pr.getCurrentPage();
			//计算起始条数
			int start = (currentPage-1)*pageMax;
			//获取分页列表
			List<Item> list=id.selectItemsByState(state,start,pageMax);
			pr.setList(list);
			
			//获取总条数
			int totalCount=id.selectItemCountByState(state);
			pr.setTotalCount(totalCount);
			
			//计算总页数
			int totalPage=totalCount%pageMax==0?totalCount/pageMax:totalCount/pageMax+1;
			pr.setTotalPage(totalPage);
		} catch (Exception e) {
			throw e;
		}finally{
			id.closeConnection();
		}
	}
	/**
	 * 修改商品状态
	 * @param parseInt
	 * @param state
	 * @throws Exception 
	 */
	public void changeItemState(int iid, String state) throws Exception {
		ItemDao id=new ItemDao();
		try {
			id.changeItemState(iid, state);
		} catch (Exception e) {
			throw e;
		}finally{
			id.closeConnection();
		}
		
	}
}
