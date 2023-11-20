package com.Batman.dto;


import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;
@Data
@Document
public class Food {
     @Id
     private String id;
     private String foodName;
     private String foodCategory;
     private Double foodPrice;
}
