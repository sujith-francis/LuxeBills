package com.Batman.service;

import java.io.IOException;
import java.time.LocalDateTime;


import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.Batman.bo.UserBO;
import com.Batman.dto.User;
import com.Batman.repository.ILuxeBillUserMgmtRepo;

@Service
public class LuxeBillUserServiceImpl implements ILuxeBillUserMgmtService {
	
	@Autowired
	private ILuxeBillUserMgmtRepo userRepo;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public String registerUser(UserBO bo) throws IOException {
		User user = new User();
		BeanUtils.copyProperties(bo, user);
		user.setPassword(passwordEncoder.encode(bo.getPassword()));
		user.setProfile(bo.getProfile().getBytes());
		user.setShopcertificate(bo.getShopcertificate().getBytes());
		user.setSubscribedDateAndTime(LocalDateTime.parse(bo.getSubscribedDateAndTime()));
	    
		try {
			User savedUser = userRepo.insert(user);
			if(savedUser!=null) {
				return "success";
			}
		}catch (DuplicateKeyException e) {
			return "error";
		}
		
		return "fail";
	}

	

}
