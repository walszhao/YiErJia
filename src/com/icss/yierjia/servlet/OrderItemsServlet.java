package com.icss.yierjia.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.icss.yierjia.biz.AddressBiz;
import com.icss.yierjia.biz.ShopcartBiz;
import com.icss.yierjia.entity.Address;
import com.icss.yierjia.entity.User;

/**
 * Servlet implementation class OrderItemsServlet
 */
public class OrderItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderItemsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//用户id
		User user=(User) request.getSession().getAttribute("user");
		int uid = user.getUid();
		//获取商品id
		String[] ids = request.getParameterValues("items");
		ShopcartBiz biz = new ShopcartBiz();
		List<String> itemList = biz.shopcartSelectedList(uid, ids);
		//获取该用户下的地址列表
		AddressBiz aBiz = new AddressBiz();
		List<Address> addressList = null;
		try {
			addressList = aBiz.allAddress(uid);
			JSONArray itemJson = JSONArray.fromObject(itemList);
			JSONArray addressJson = JSONArray.fromObject(addressList);
			request.setAttribute("items", itemJson);
			request.setAttribute("address", addressJson);
			request.getRequestDispatcher("/person/order.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
