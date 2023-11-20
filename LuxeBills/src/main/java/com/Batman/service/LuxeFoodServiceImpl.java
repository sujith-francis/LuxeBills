package com.Batman.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Batman.dto.Bill;
import com.Batman.dto.Food;
import com.Batman.repository.ILuxeBillFoodRepo;
import com.Batman.repository.ILuxeBillPaymentRepo;

@Service
public class LuxeFoodServiceImpl implements ILuxeBillFoodService {
    @Autowired
	private ILuxeBillFoodRepo foodRepo; 
    
    @Autowired
   	private ILuxeBillPaymentRepo paymentRepo;
   	
	
	@Override
	public List<Food> getAllFoods() {
		return foodRepo.findAll();
	}

	@Override
	public String saveFood(Food food) 
	 {
		if(food.getId().equals("")) {
			food.setId(null);
		}
		Food food2 = foodRepo.save(food);
		if(food2!=null) {
		return "success";
		}else {
			return "failed";
		}
	}

	@Override
	public List<Food> fetchByCategory(String category) {
		List<Food> list = foodRepo.findByFoodCategory(category);
		if(!list.isEmpty()) {
			return list;
		}
		return null;
	}

	@Override
	public Food searchFoodById(String id) {
		Food food = foodRepo.findById(id).orElse(null);
		return food;
	}


	@Override
	public void deleteFoodByID(String foodID) {
		foodRepo.deleteById(foodID);
		
	}

	@Override
	public Bill saveBill(Bill bill) {
		return paymentRepo.save(bill);
	}

	@Override
	public Bill searchpendingBill(Integer tableNo, String status) {
		return paymentRepo.findByTableNoAndStatus(tableNo, status);
	}

	@Override
	public Bill searchBillById(String id) {
		Bill bill = paymentRepo.findById(id).orElse(null);
		return bill;
	}

	@Override
	public void deleteBillById(String id) {
		paymentRepo.deleteById(id);
	}

	@Override
	public void finishBill(Bill bill) {
       bill.setBillDate(LocalDateTime.now());
       paymentRepo.save(bill);
	}

	@Override
	public List<Bill> searchAllBillByUser(String usermail) {
		List<Bill> billHistory = paymentRepo.findByUsermail(usermail);
		return billHistory;
	}

	

}
