package com.icss.yierjia.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.icss.yierjia.biz.AddressBiz;
import com.icss.yierjia.entity.Address;
import com.icss.yierjia.entity.User;

/**
 * Servlet implementation class BuyItemNowServlet
 */
public class BuyItemNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyItemNowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//用户id
		User user=(User) request.getSession().getAttribute("user");
		int uid = user.getUid();//item转换为json格式(2,辣条零食大礼包,29.9,3.jpg,4)
		String iid = request.getParameter("iid");
		String iname = request.getParameter("iname");
		String iprice = request.getParameter("iprice");
		String iimg = request.getParameter("iimg");
		String icount = request.getParameter("icount");
		String item = iid+","+iname+","+iprice+","+iimg+","+icount;
		List<String> itemList = new ArrayList<String>();
		itemList.add(item);
		//获取该用户下的地址列表
		AddressBiz aBiz = new AddressBiz();
		List<Address> addressList = null;
		try {
			addressList = aBiz.allAddress(uid);
		} catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
		//item转换为json格式(2,辣条零食大礼包,29.9,3.jpg,4)
		JSONArray itemJson = JSONArray.fromObject(itemList);
		JSONArray addressJson = JSONArray.fromObject(addressList);
		request.setAttribute("items", itemJson);
		request.setAttribute("address", addressJson);
		request.getRequestDispatcher("/person/order.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
