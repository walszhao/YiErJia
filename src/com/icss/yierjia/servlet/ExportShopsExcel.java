package com.icss.yierjia.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.yierjia.biz.ShopBiz;
import com.icss.yierjia.entity.Shop;
import com.icss.yierjia.util.ExportExcel;

/**
 * Servlet implementation class ExportShopsExcel
 */
public class ExportShopsExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExportShopsExcel() {
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
		ShopBiz biz = new ShopBiz();
		try {
			//获取用户列表
			List<Shop> list = biz.findShopsByState(state);
			String[] headers = {"店铺id","店铺名称","用户名","密码","手机号","邮箱","描述","地址","状态","图片"};
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
