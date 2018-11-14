package com.icss.yierjia.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import com.icss.yierjia.biz.OrderBiz;
import com.icss.yierjia.entity.User;
import com.icss.yierjia.util.JsonDateValueProcessor;
import com.icss.yierjia.vo.OrderVo;

/**
 * Servlet implementation class AjaxAllOrdersServlet
 */
public class AjaxAllOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxAllOrdersServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取uid
		User user=(User)request.getSession().getAttribute("user");
		int uid=user.getUid();
		//获取所有订单
		OrderBiz orderBiz = new OrderBiz();
		//创建OrderVo的List
		List<OrderVo> list = new ArrayList<OrderVo>();
		try {
			orderBiz.setOrderVo(list,uid);
			//转换为json
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
			JSONArray json = JSONArray.fromObject(list,jsonConfig);
			response.getWriter().print(json.toString());
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
