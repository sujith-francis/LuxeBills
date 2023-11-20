package com.Batman.dto;

import java.io.Serializable;
import java.time.LocalDateTime;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;
@Document
@Data
public class User implements Serializable {

	private static final long serialVersionUID = 1L;
    
	@Id
	private String id;
	@Indexed(unique = true)
	private String usermail;
	private String userName;
	private String password;
	private String shopName;
	
	private byte[] profile;
	private byte[] shopcertificate;
	private LocalDateTime subscribedDateAndTime;
	private Integer subscriptionduration;
	

}
