package com.icss.yierjia.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.yierjia.biz.UserBiz;
import com.icss.yierjia.entity.User;

/**
 * Servlet implementation class BindEmailServlet
 */
public class BindEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BindEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		String email = request.getParameter("email");
		//获取验证码
		String checkCode = request.getParameter("checkCode");
		String tempEmail = (String) request.getSession().getAttribute("email");
		PrintWriter out = response.getWriter(); 
		if(email.equals(tempEmail)){
			int uid = user.getUid();
			
			UserBiz userBiz = new UserBiz();
			try {
				String code = Integer.toString(userBiz.findCheckCode(uid));
				//判断验证码是否匹配
				if (code.equals(checkCode)) {
					userBiz.changeEmail(uid,email);
					User user2 = userBiz.findByUid(uid);
					request.getSession().setAttribute("user", user2);
					userBiz.addCheckCode(uid, 0);
					out.print("success");
				}else{
					out.print("fail");
				}
			} catch (Exception e) {
				request.setAttribute("msg", e.getMessage());
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		}else{
			out.print("emailError");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
