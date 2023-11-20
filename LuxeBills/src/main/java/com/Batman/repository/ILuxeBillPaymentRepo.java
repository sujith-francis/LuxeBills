package com.Batman.repository;


import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.Batman.dto.Bill;


public interface ILuxeBillPaymentRepo extends MongoRepository<Bill, String> {
	Bill findByTableNoAndStatus(Integer tableNo,String status);
	List<Bill> findByUsermail(String usermail);
}
