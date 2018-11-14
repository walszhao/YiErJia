package com.icss.yierjia.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.icss.yierjia.biz.ItemBiz;
import com.icss.yierjia.util.IndexList;

/**
 * Servlet implementation class FindFoodsServlet
 */
public class AjaxIndexListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIndexListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		IndexList il=new IndexList();
		ItemBiz ib=new ItemBiz();
		try {
			ib.setIndexList(il);
			List<Object> list = new ArrayList<Object>();
			list.add(il.getFoodList());
			list.add(il.getClothesList());
			list.add(il.getDigitalList());
			JSONArray json = JSONArray.fromObject(list);
			//System.out.println(json.toString());
			out.print(json.toString());
			
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
