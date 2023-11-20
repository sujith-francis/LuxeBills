package com.Batman.dto;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.Data;
@Data
@Document
public class History {
    @Id
	private String id;
    private String usermail;
    private List<String> billIds;
    private LocalDate historyDate;
    
}
