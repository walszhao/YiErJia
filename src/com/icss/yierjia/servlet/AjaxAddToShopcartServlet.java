package com.icss.yierjia.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.yierjia.biz.ShopcartBiz;

/**
 * Servlet implementation class AddToShopcart
 */
public class AjaxAddToShopcartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAddToShopcartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getParameter("uid");
		String iid=request.getParameter("iid");
		String iname=request.getParameter("iname");
		String iprice=request.getParameter("currentprice");
		String iimg=request.getParameter("iimg");
		String icount=request.getParameter("icount");
		PrintWriter out=response.getWriter();
		try {
			ShopcartBiz sb=new ShopcartBiz();
			sb.addToShopcart(Integer.parseInt(uid), iid, iname, iprice, iimg, icount);
			out.print("success");
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
