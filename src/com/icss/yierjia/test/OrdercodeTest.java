package com.icss.yierjia.test;

import com.icss.yierjia.util.OrderId;

public class OrdercodeTest {
	
	public static void main(String[] args) {
		String orderId = OrderId.getOrderId(1);
		System.out.println(orderId);
	}

}
