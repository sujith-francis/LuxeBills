package com.Batman.repository;

import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.Batman.dto.Food;

public interface ILuxeBillFoodRepo extends MongoRepository<Food, String> {
  List<Food> findByFoodCategory(String foodCategory);
}
