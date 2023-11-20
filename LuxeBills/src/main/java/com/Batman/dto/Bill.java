package com.Batman.dto;

import java.time.LocalDateTime;
import java.util.Map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.Batman.bo.FoodBO;

import lombok.Data;

@Data
@Document
public class Bill {
    @Id
	private String id;
    private Integer tableNo;
    private String usermail;
	private Map<String,FoodBO> food;
	private Double cost;
	private String status;
	private String paymentMode;
	private LocalDateTime billDate;
}
