package com.icss.yierjia.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.yierjia.biz.ShopBiz;
import com.icss.yierjia.entity.Shop;

/**
 * Servlet implementation class ShopDetailServlet
 */
public class ShopDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取参数
		String sid = request.getParameter("sid");
		//查询店铺信息
		if (sid != null && !sid.equals("")) {
			ShopBiz biz = new ShopBiz();
			try {
				Shop shop = biz.findBySid(Integer.parseInt(sid));
				//设置请求参数
				request.setAttribute("shop", shop);
				//跳转
				request.getRequestDispatcher("/shop_detail.jsp").forward(request, response);
			} catch (Exception e) {
				request.setAttribute("msg", e.getMessage());
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
