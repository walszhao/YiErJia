package com.icss.yierjia.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.icss.yierjia.biz.ItemBiz;
import com.icss.yierjia.entity.Item;
import com.icss.yierjia.util.PageResult;

/**
 * Servlet implementation class MgrItemListServlet
 */
public class MgrItemListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MgrItemListServlet() {
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
		String state=request.getParameter("state");
		if (state==null||"".equals(state)) {
			state="2";
		}
		ItemBiz ib=new ItemBiz();
		try {
			PageResult<Item> pr=new PageResult<Item>();
			pr.setCurrentPage(Integer.parseInt(currentPage));
			if (state.equals("2")) {
				ib.itemList(pr,Integer.parseInt(pageMax));
			}else{
				ib.itemStateList(pr, Integer.parseInt(pageMax), state);
			}
			
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
