package com.icss.yierjia.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.icss.yierjia.biz.UserBiz;
import com.icss.yierjia.entity.User;

/**
 * Servlet implementation class LoginServelt
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username =request.getParameter("username");
		String pwd=request.getParameter("pwd");
		String days=request.getParameter("days");
		
		
		UserBiz ub=new UserBiz();
		try {
			User user=ub.findUserByIdAndPwd(username, pwd);
			if (user!=null) {
				/*if (days!=null&&!"".equals(days)) {
					Cookie usernameCookie=new Cookie("username", username);
					Cookie pwdCookie=new Cookie("pwd", pwd);
					usernameCookie.setMaxAge(Integer.parseInt(days)*24*60*60);
					pwdCookie.setMaxAge(Integer.parseInt(days)*24*60*60);
					response.addCookie(usernameCookie);
					response.addCookie(pwdCookie);
				}*/
				String state=user.getUstate();
				if (state.equals("1")) {
					request.getSession().setAttribute("user", user);
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				}else if (state.equals("0")) {
					request.setAttribute("msg", "对不起，您的账号审核未通过，请联系管理员");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("msg", "用户名或密码错误");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

}
