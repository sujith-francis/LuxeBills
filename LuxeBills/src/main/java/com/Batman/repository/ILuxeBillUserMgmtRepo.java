package com.Batman.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.Batman.dto.User;

public interface ILuxeBillUserMgmtRepo extends MongoRepository<User, String> {
  User findByusermail(String usermail);
}
