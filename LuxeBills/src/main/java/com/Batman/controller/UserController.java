package com.Batman.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Batman.bo.UserBO;
import com.Batman.dto.User;
import com.Batman.service.ILuxeBillUserMgmtService;

@Controller
@SuppressWarnings("unused")
public class UserController {
	@Autowired
	private ILuxeBillUserMgmtService userService;
	
    @GetMapping("/home")
	public String getHome() {
		return "home";
	}
    @GetMapping("/#")
   	public String inProgress(Map<String, Object> model) {
    	model.put("message", "This Feature Will Be Added Soon");
   		return "result";
   	}
    @GetMapping("login")
    public String getLogin() {
    	return "login";
    }
   
    @GetMapping("buySubscription")
    public String getBuy() {
    	return "buysubscription";
    }
    
    @GetMapping("getSubscription")
    public String getUserDetailsPage(Map<String, Object> model,@RequestParam String subscriptionduration) {
    	Integer subscriptionduration_value = Integer.parseInt(subscriptionduration.replaceAll("[^0-9]", ""));
    	model.put("subscriptionduration_value", subscriptionduration_value);
    	return "userdetails";
    }
    
    
    @PostMapping("subscribe")
    public String subscribe(Map<String, Object> model, @ModelAttribute UserBO userBO) throws IOException {
    	String result = userService.registerUser(userBO);
    	if(result.equalsIgnoreCase("success")) {
    		model.put("message", "SuccesFully Subscribed!! Enjoy The Features");
    	}
    	else if (result.equalsIgnoreCase("error")) {
    		model.put("message", "User Already Exists");
		}
    	else {
    		model.put("message", "Sorry,Failed to Subscribe");
    	}
    	return "result";
	}
    
    
    
    
}
