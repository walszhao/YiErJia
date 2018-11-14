package com.icss.yierjia.biz;

import com.icss.yierjia.dao.OrderDao;
import com.icss.yierjia.dao.ShopDao;
import com.icss.yierjia.dao.UserDao;
import com.icss.yierjia.util.Count;


public class AdminBiz {

	/**
	 * 设置数量属性
	 * @param count
	 * @throws Exception
	 */
	public void setCounts(Count count) throws Exception{
		UserDao userDao = new UserDao();
		ShopDao shopDao = new ShopDao();
		OrderDao orderDao = new OrderDao();
		try {
			count.setUserCount(userDao.getStateCount("1"));
			count.setDeletedUserCount(userDao.getStateCount("0"));
			count.setAdminCount(userDao.selectAdminCount());
			count.setShopCount(shopDao.selectShopCountByState("1"));
			count.setUnactivatedShopCount(shopDao.selectShopCountByState("0"));
			count.setOrderCount(orderDao.selectOrderCount());
		} catch (Exception e) {
			throw e;
		} finally{
			userDao.closeConnection();
			shopDao.closeConnection();
			orderDao.closeConnection();
		}
	}
}
