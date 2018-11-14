package com.icss.yierjia.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.yierjia.biz.ItemBiz;
import com.icss.yierjia.entity.Item;
import com.icss.yierjia.util.PageResult;

/**
 * Servlet implementation class SeachItemListfServlet
 */
public class SearchByTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchByTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		String currentPage=request.getParameter("currentPage");
		if (currentPage==null&&!"".equals(currentPage)) {
			currentPage="1";
		}
		PageResult<Item> pr=new PageResult<Item>();
		pr.setCurrentPage(Integer.parseInt(currentPage));
		ItemBiz ib=new ItemBiz();
		try {
			ib.searchItemsByType(type, pr);
			request.setAttribute("type", type);
			request.setAttribute("page", pr);
			request.getRequestDispatcher("/classify_items.jsp").forward(request, response);
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
