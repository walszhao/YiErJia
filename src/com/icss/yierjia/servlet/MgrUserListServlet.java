package com.icss.yierjia.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.icss.yierjia.biz.UserBiz;
import com.icss.yierjia.entity.User;
import com.icss.yierjia.util.PageResult;

/**
 * Servlet implementation class MgrUserListServlet
 */
public class MgrUserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MgrUserListServlet() {
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
		UserBiz ub=new UserBiz();
		try {
			PageResult<User> pr=new PageResult<User>();
			pr.setCurrentPage(Integer.parseInt(currentPage));
			if (state.equals("2")) {
				ub.userList(pr,Integer.parseInt(pageMax));
			}else{
				ub.userStateList(pr, Integer.parseInt(pageMax), state);
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
