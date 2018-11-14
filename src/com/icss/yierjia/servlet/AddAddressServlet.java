package com.icss.yierjia.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.yierjia.biz.AddressBiz;
import com.icss.yierjia.entity.User;

/**
 * Servlet implementation class AddAddressServlet
 */
public class AddAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user=(User)request.getSession().getAttribute("user");
		int uid=user.getUid();
		String reciver=request.getParameter("reciver");
		String phone=request.getParameter("phone");
		String province=request.getParameter("inprovince");
		String city=request.getParameter("incity");
		String area=request.getParameter("inarea");
		String street=request.getParameter("street");
		
		AddressBiz ab=new AddressBiz();
		try {
			ab.addAddress(uid, reciver, phone, province, city, area, street);
			PrintWriter out = response.getWriter();
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
