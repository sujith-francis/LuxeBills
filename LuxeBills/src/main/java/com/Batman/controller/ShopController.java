package com.Batman.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.Batman.bo.FoodBO;
import com.Batman.dto.Bill;
import com.Batman.dto.Food;
import com.Batman.dto.User;
import com.Batman.service.ILuxeBillFoodService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired
	private ILuxeBillFoodService service;

	@GetMapping("/home")
	public String getUserInterface(@SessionAttribute User user) {
		return "userinterface";
	}

	@GetMapping("/live")
	public String getLive() {
		return "live";
	}

	@GetMapping("/food_category")
	public String getFoodCategories() {
		return "food_category";
	}
	 @GetMapping("/#")
	   	public String inProgress(Map<String, Object> model) {
	    	model.put("message", "This Feature Will Be Added Soon");
	   		return "result";
	   	}

	@GetMapping("/food_items")
	public String getFoodItems(Map<String, Object> model) {

		List<Food> list = service.fetchByCategory("Beverages");
		model.put("foods", list);
		return "food_items";
	}

	@GetMapping("/table_bill")
	public String getTableBill(Map<String, Object> model, @RequestParam Integer table) {
		Bill pendingBill = service.searchpendingBill(table, "pending");
		if (pendingBill == null) {
			Bill bill = new Bill();
			bill.setTableNo(table);
			bill.setStatus("pending");
			Bill saveBill = service.saveBill(bill);
			model.put("newbill", saveBill);
		} else {
			model.put("newbill", pendingBill);
		}
		return "table_bill";
	}

	@GetMapping("/foods")
	public String getAllFoods(Map<String, Object> model) {
		List<Food> foods = service.getAllFoods();
		model.put("foodItems", foods);
		return "foods";
	}

	@GetMapping("/addfood")
	public String addFood(Map<String, Object> model) {
		Food food = new Food();
		model.put("food", food);
		return "addFood";
	}

	@PostMapping("/submitfood")
	public String saveFood(Map<String, Object> model, @ModelAttribute("food") Food food) {
	String saveFood = service.saveFood(food);
		if (saveFood.equals("success")) {
			return "redirect:./foods";
		} else {

			model.put("message", "Failed to Add Food");
			return "result";
		}
	}
	@GetMapping("/deletefood")
	public String deleteFood(@RequestParam String id) {
		service.deleteFoodByID(id);
		return "redirect:./foods";
	}
	@GetMapping("/updatefood")
	public String getUpdateForm(Map<String, Object> model, @RequestParam String id) {
		Food food = service.searchFoodById(id);
		model.put("food", food);
		return "addFood";
	}

	@GetMapping("/fetchFoods")
	public String fetchFoodByCategory(Map<String, Object> model, @RequestParam String foodCategory) {
		List<Food> list = service.fetchByCategory(foodCategory);
		model.put("foods", list);
		return "food_items";
	}

	@GetMapping("/bill")
	public String addFoodToBill(Map<String, Object> model, @RequestParam String food, @RequestParam String billID) {
		Food foodItem = service.searchFoodById(food);
		Bill bill = service.searchBillById(billID);
		if (bill.getFood() == null) {
			HashMap<String, FoodBO> foodmap = new HashMap<>();
			FoodBO foodBO = new FoodBO();
			foodBO.setFoodName(foodItem.getFoodName());
			foodBO.setFoodPrice(foodItem.getFoodPrice());
			foodBO.setQuantity(1);
			foodmap.put(foodItem.getFoodName(), foodBO);
			bill.setFood(foodmap);
		} else if (bill.getFood().containsKey(foodItem.getFoodName())) {
			FoodBO bo = bill.getFood().get(foodItem.getFoodName());
			bo.setQuantity(bill.getFood().get(foodItem.getFoodName()).getQuantity() + 1);
			bill.getFood().put(foodItem.getFoodName(), bo);
		} else {
			FoodBO foodBO = new FoodBO();
			foodBO.setFoodName(foodItem.getFoodName());
			foodBO.setFoodPrice(foodItem.getFoodPrice());
			foodBO.setQuantity(1);
			bill.getFood().put(foodItem.getFoodName(), foodBO);
		}
		Bill bill2 = service.saveBill(bill);
		model.put("newbill", bill2);
		return "table_bill";

	}

	@PostMapping("/closebill")
	public String closeBill(@ModelAttribute("bill") Bill bill, Map<String, Object> model, @SessionAttribute User user) {

		if(bill.getFood()==null) {
			return "redirect:./history";
		}
		Bill saveBill = service.saveBill(bill);
		Collection<FoodBO> foods = saveBill.getFood().values();
		Double cost = 0.0;
		for (FoodBO foodBO : foods) {
			foodBO.setFoodPrice(foodBO.getQuantity() * foodBO.getFoodPrice());

			cost += foodBO.getFoodPrice();
		}
		saveBill.setCost(cost);
		Bill bill2 = service.saveBill(saveBill);
		model.put("newbill", bill2);
		return "confirmBill";
	}

	@PostMapping("/update_bill")
	public void updateBill(@ModelAttribute Bill bill) {
		service.saveBill(bill);
	}

	@PostMapping("/paybill")
	public String payBill(@ModelAttribute Bill bill) {
		service.finishBill(bill);
		return "redirect:./history";
	}

	@PostMapping("/cancelbill")
	public String cancelBill(HttpServletRequest req) {
		String id = req.getParameter("id");
		service.deleteBillById(id);
		return "redirect:./history";
	}

	@GetMapping("/history")
	public String getHistoryPage(@SessionAttribute User user, Map<String, Object> model) {
		List<Bill> billByUser = service.searchAllBillByUser(user.getUsermail());
		model.put("bills", billByUser);
		return "history";
	}

}
