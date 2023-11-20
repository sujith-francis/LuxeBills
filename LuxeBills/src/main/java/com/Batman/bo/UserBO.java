package com.Batman.bo;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class UserBO {


	private String usermail;
	private String userName;
	private String password;
	private String shopName;
	private MultipartFile profile;
	private MultipartFile shopcertificate;
	private String subscribedDateAndTime;
	private Integer subscriptionduration;
	

}
