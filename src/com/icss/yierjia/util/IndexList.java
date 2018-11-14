package com.icss.yierjia.util;

import java.util.List;

import com.icss.yierjia.entity.Item;

public class IndexList {
	private List<Item> foodList;
	private List<Item> clothesList;
	private List<Item> digitalList;
	public List<Item> getFoodList() {
		return foodList;
	}
	public void setFoodList(List<Item> foodList) {
		this.foodList = foodList;
	}
	public List<Item> getClothesList() {
		return clothesList;
	}
	public void setClothesList(List<Item> clothesList) {
		this.clothesList = clothesList;
	}
	public List<Item> getDigitalList() {
		return digitalList;
	}
	public void setDigitalList(List<Item> digitalList) {
		this.digitalList = digitalList;
	}
	
}
