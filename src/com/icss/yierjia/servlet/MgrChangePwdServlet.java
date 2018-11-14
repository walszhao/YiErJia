package com.icss.yierjia.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.icss.yierjia.biz.UserBiz;
import com.icss.yierjia.entity.User;

/**
 * Servlet implementation class MgrChangePwdServlet
 */
public class MgrChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MgrChangePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		User user=(User)session.getAttribute("user");
		int uid=user.getUid();
		String newpwd=request.getParameter("newpwd");
		
		UserBiz ub=new UserBiz();
		try {
			ub.changePwd(uid, newpwd);
			session.invalidate();
			request.setAttribute("msg", "修改密码成功,请重新登录");
			request.getRequestDispatcher("admin_login.jsp").forward(request, response);
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
