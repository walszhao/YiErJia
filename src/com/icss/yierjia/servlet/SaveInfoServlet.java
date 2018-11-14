package com.icss.yierjia.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icss.yierjia.biz.UserBiz;
import com.icss.yierjia.entity.User;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class SavaInfoServlet
 */
public class SaveInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//保存在什么路径下
		String dir ="E:/eclipse/JavaEE/yierjia/userhead";
		//每个文件最大5m,最多1个文件
		int maxPostSize =1 * 5 * 1024 * 1024 ;
		//response的编码为"utf-8",同时采用缺省的文件名冲突解决策略,实现上传
		MultipartRequest multi =new MultipartRequest(request, dir, maxPostSize,"utf-8");
		//获取表单中的其他参数
		String uid=multi.getParameter("uid");
		String urealname=multi.getParameter("realname");
		String uphone=multi.getParameter("phone");
		String uemail=multi.getParameter("email");
		//输出反馈信息
		Enumeration files = multi.getFileNames();
		String fileName=null;
		UserBiz ub=new UserBiz();
		while (files.hasMoreElements()) {
			String name = (String)files.nextElement();
			File fileUpload = multi.getFile(name);
			if(fileUpload!=null){
				fileName = multi.getFilesystemName(name);
				//原文件名
				String imgPath=fileUpload.getName();
				//切割后缀名
				int idx = imgPath.lastIndexOf(".");  
                String extention= imgPath.substring(idx);
                String newImgPath = "head"+uid+extention;
                try {
					ub.saveUserImg(Integer.parseInt(uid), newImgPath);
					File f=new File(dir+"/"+newImgPath);
	                fileUpload.renameTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				}
                
			}
		}
		
		try {
			ub.saveUserInfo(Integer.parseInt(uid), urealname, uphone, uemail);
			//重新设置会话属性
			User user = ub.findByUid(Integer.parseInt(uid));
			request.getSession().setAttribute("user", user);
			//随机数
			request.setAttribute("msg", "保存成功");
			request.getRequestDispatcher("/person/personal.jsp").forward(request, response);
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
