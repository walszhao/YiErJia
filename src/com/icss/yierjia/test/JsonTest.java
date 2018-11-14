package com.icss.yierjia.test;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

public class JsonTest {
	
	public static void main(String[] args) {
		List<String> list1 = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		List<List<String>> list3 = new ArrayList<>();
		list1.add("123");
		list1.add("456");
		list1.add("789");
		list2.add("abc");
		list2.add("def");
		list2.add("ghi");
		list3.add(list1);
		list3.add(list2);
		JSONArray jsonArray = JSONArray.fromObject(list3);
		System.out.println(jsonArray.toString());
		
		
		
	}

}
