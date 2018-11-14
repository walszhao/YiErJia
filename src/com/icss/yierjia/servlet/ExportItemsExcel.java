package com.icss.yierjia.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.yierjia.biz.ItemBiz;
import com.icss.yierjia.entity.Item;
import com.icss.yierjia.util.ExportExcel;

/**
 * Servlet implementation class ExportItemsExcel
 */
public class ExportItemsExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExportItemsExcel() {
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
		ItemBiz biz = new ItemBiz();
		try {
			//获取用户列表
			List<Item> list = biz.findItemsByState(state);
			String[] headers = {"商品id","店铺id","种类","商品名称","现价","原价","描述","商品图片","状态"};
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
