package com.sunflower.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDao<User>{
	List<User> selectId(String username);
}