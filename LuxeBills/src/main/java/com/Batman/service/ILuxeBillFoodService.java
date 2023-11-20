package com.Batman.service;

import java.util.List;

import com.Batman.dto.Bill;
import com.Batman.dto.Food;

public interface ILuxeBillFoodService {
	List<Food> getAllFoods();
	String saveFood(Food food);
	List<Food> fetchByCategory(String category);
	Food searchFoodById(String id);
	void deleteFoodByID(String foodID);
	Bill saveBill(Bill bill);
	void finishBill(Bill bill);
	Bill searchpendingBill(Integer tableNo,String status);
	Bill searchBillById(String id);
	void deleteBillById(String id);
	List<Bill> searchAllBillByUser(String usermail);
	
}
