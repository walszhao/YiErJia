package com.icss.yierjia.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.yierjia.biz.UserBiz;
import com.icss.yierjia.entity.User;
import com.icss.yierjia.util.MailUtil;

/**
 * Servlet implementation class SendCheckCode
 */
public class SendCheckCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendCheckCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		String email = request.getParameter("email");
		int uid = user.getUid();
		int checkCode = (int) ((Math.random()*9+1)*100000);
		UserBiz userBiz = new UserBiz();
		try {
			userBiz.addCheckCode(uid, checkCode);
			String emailMsg = "欢迎使用宜而佳，您的激活码为："+checkCode;
			MailUtil.sendMail(email, emailMsg);
			request.getSession().setAttribute("email", email);
			response.getWriter().print("success");
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
