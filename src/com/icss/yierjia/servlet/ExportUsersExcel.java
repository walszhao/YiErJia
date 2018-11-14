package com.icss.yierjia.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.yierjia.biz.UserBiz;
import com.icss.yierjia.dao.OrderDao;
import com.icss.yierjia.entity.Order;
import com.icss.yierjia.entity.User;
import com.icss.yierjia.util.ExportExcel;

/**
 * Servlet implementation class ExportUsersExcel
 */
public class ExportUsersExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExportUsersExcel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//文档路径
		String docsPath = request.getSession().getServletContext().getRealPath("docs");
		//获取参数
		String state = request.getParameter("state");
		//创建导出工具
		ExportExcel ex = new ExportExcel();
		UserBiz biz = new UserBiz();
		try {
			//获取用户列表
			List<User> list = biz.findUsersByState(state);
			String[] headers = {"用户id","用户名","头像","真实姓名","密码","手机号","邮箱","地址","支付密码","余额","用户状态","用户角色","验证码"};
			ex.export(docsPath, headers, list,"用户表");
			String FILE_SEPARATOR = System.getProperties().getProperty("file.separator");
			String fileName = "ExportData.xls";
			String filePath = docsPath + FILE_SEPARATOR + fileName;
			//下载
			ex.download(filePath, response);
			
		} catch (Exception e) {
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
