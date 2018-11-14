package com.icss.yierjia.biz;

import java.sql.Timestamp;
import java.util.List;

import com.icss.yierjia.dao.OrderDao;
import com.icss.yierjia.dao.OrderItemDao;
import com.icss.yierjia.dao.ShopcartDao;
import com.icss.yierjia.entity.Item;
import com.icss.yierjia.entity.Order;
import com.icss.yierjia.util.OrderId;
import com.icss.yierjia.util.PageResult;
import com.icss.yierjia.vo.OrderItemVo;
import com.icss.yierjia.vo.OrderVo;

public class OrderBiz {
	public void createOrder(String[] idArr,String[] countArr,int uid,Timestamp tt,String address,String name,String phone) throws Exception {
		OrderDao od=new OrderDao();
		ShopcartDao shopcartDao = new ShopcartDao();
		try {
			//打开事务
			od.beginTransaction();
			//获取商店id和商店数量
			List<Integer> list=od.getSid(idArr);
			int scount=list.size();
			for (int i = 0; i < scount; i++) {
				//初始化订单价格
				double totalPrice = 0.0;
				//生成订单号
				String orderid=OrderId.getOrderId(uid);
				//添加订单
				od.addOrder(uid,list.get(i).intValue(), tt, address, name, phone,orderid);
				//添加订单项
				for(int j=0;j<idArr.length;j++){
					//查询商品信息
					Item item = od.selectItemById(Integer.parseInt(idArr[j]));
					//添加订单项
					if (list.get(i).intValue()==item.getSid()) {
						//数量
						int count = Integer.parseInt(countArr[j]);
						//单价
						double price = item.getCurrentprice();
						od.addOrderTerm(Integer.parseInt(idArr[j]), orderid, Integer.parseInt(countArr[j]), item.getCurrentprice());
						//从购物车中删除指定商品
						shopcartDao.deleteShopcartItem(uid, idArr[j]);
						//订单项价格
						totalPrice += count * price;
					}
				}
				//插入订单总价
				od.setTotalPrice(orderid,totalPrice);
			}
			//提交
			od.commit();
		} catch (Exception e) {
			od.rollback();
			throw e;
		}finally{
			od.closeConnection();
		}
	}
	
	/**
	 * 查找指定用户的所有订单信息
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	public List<Order> findAllByUid(int uid) throws Exception{
		List<Order> list = null;
		OrderDao dao = new OrderDao();
		try {
			list = dao.selectAllByUid(uid);
		} catch (Exception e) {
			throw e;
		} finally{
			dao.closeConnection();
		}
		return list;
	}
	

	/**
	 * 设置List<OrderVo>
	 * @param list
	 * @param uid
	 * @throws Exception
	 */
	public void setOrderVo(List<OrderVo> list,int uid) throws Exception {
		OrderDao orderDao = new OrderDao();
		OrderVo orderVo = null;
		List<OrderItemVo> orderItems = null;
		try {
			//获取所有订单号
			List<String> oids = orderDao.selectOidsByUid(uid);
			//遍历订单号
			for (String oid : oids) {
				orderVo = new OrderVo();
				//设置order属性
				orderDao.setOrderVoByOid(oid, orderVo);
				//设置list属性
				orderItems = orderDao.selectByOid(oid);
				orderVo.setOrderItems(orderItems);
				//添加进List<OrderVo>
				list.add(orderVo);
			}
		} catch (Exception e) {
			orderDao.rollback();
			throw e;
		} finally{
			orderDao.closeConnection();
		}
		
	}
	
	/**
	 * 查询所有订单并分页显示
	 * @return
	 * @throws Exception 
	 */
	public void orderList(PageResult<Order> pr,int pageMax) throws Exception{
		OrderDao od=new OrderDao();
		try {
			//获取当前页
			int currentPage=pr.getCurrentPage();
			//计算起始条数
			int start = (currentPage-1)*pageMax;
			//获取分页列表
			List<Order> list=od.selectAllOrders(start,pageMax);
			pr.setList(list);
			
			//获取总条数
			int totalCount=od.getOrderCount();
			pr.setTotalCount(totalCount);
			
			//计算总页数
			int totalPage=totalCount%pageMax==0?totalCount/pageMax:totalCount/pageMax+1;
			pr.setTotalPage(totalPage);
		} catch (Exception e) {
			throw e;
		}finally{
			od.closeConnection();
		}
	}
	
	/***
	 * 设置OrderVo
	 * @param oid
	 * @param ov
	 * @throws Exception
	 */
	public void setOrderVO(String oid,OrderVo ov) throws Exception{
		OrderDao od=new OrderDao();
		OrderItemDao oi=new OrderItemDao();
		try {
			//根据订单id查询订单，并设置到ov中
			od.setOrderVoByOid(oid,ov);
			//根据订单id查询订单详情列表，并设置到ov中
			List<OrderItemVo> list=oi.selectByOid(oid);
			ov.setOrderItems(list);
		} catch (Exception e) {
			throw e;
		}finally{
			od.closeConnection();
		}
	}
}
