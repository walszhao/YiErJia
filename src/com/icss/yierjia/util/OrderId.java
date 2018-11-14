package com.icss.yierjia.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderId {
	
	public static String getOrderId(int uid){
		//随机六位数
		int code = (int) ((Math.random()*9+1)*100000);
		//获取年月日时分秒
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyyMMddhhmmss");
		String time=df.format(date);
		//拼接生成订单号
		String Ordercode = time + Integer.toString(code) + Integer.toString(uid);
		return Ordercode;
	}
	
	
	
}
