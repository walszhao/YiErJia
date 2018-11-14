package com.icss.yierjia.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.icss.yierjia.biz.OrderBiz;
import com.icss.yierjia.entity.Order;
import com.icss.yierjia.util.PageResult;

/**
 * Servlet implementation class MgrOrderListServlet
 */
public class MgrOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MgrOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String currentPage=request.getParameter("page");
		String pageMax=request.getParameter("rows");
		OrderBiz ob=new OrderBiz();
		try {
			PageResult<Order> pr=new PageResult<Order>();
			pr.setCurrentPage(Integer.parseInt(currentPage));
			ob.orderList(pr, Integer.parseInt(pageMax));
			
			JSONObject json=new JSONObject();
			json.accumulate("total",pr.getTotalCount());
			json.accumulate("rows", pr.getList());
			out.print(json);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
