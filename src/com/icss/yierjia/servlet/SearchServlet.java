package com.icss.yierjia.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.yierjia.biz.ItemBiz;
import com.icss.yierjia.biz.ShopBiz;
import com.icss.yierjia.entity.Item;
import com.icss.yierjia.entity.Shop;
import com.icss.yierjia.util.PageResult;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String option=request.getParameter("option");
		String keyWords=request.getParameter("keyWords");
		String currentPage=request.getParameter("currentPage");
		
		if (currentPage==null&&!"".equals(currentPage)) {
			currentPage="1";
		}
		try {
			if (option.equals("shop")) {
				PageResult<Shop> pr=new PageResult<Shop>();//创建分页结果对象
				pr.setCurrentPage(Integer.parseInt(currentPage));//设置对象的当前页值
				ShopBiz sb=new ShopBiz();//创建Biz层对象
				sb.setPageResult(keyWords, pr);//调用设置分页结果属性的方法
				request.setAttribute("keyWords", keyWords);
				request.setAttribute("page", pr);//发送分页结果对象
				request.getRequestDispatcher("/shops.jsp").forward(request, response);//跳转
			}else if (option.equals("item")) {
				PageResult<Item> pr=new PageResult<Item>();//创建分页结果对象
				pr.setCurrentPage(Integer.parseInt(currentPage));//设置对象的当前页值
				ItemBiz ib=new ItemBiz();//创建Biz层对象
				ib.setPageResult(keyWords, pr);//调用设置分页结果属性的方法
				request.setAttribute("keyWords", keyWords);
				request.setAttribute("page", pr);//发送分页结果对象
				request.getRequestDispatcher("/items.jsp").forward(request, response);//跳转
			}
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
