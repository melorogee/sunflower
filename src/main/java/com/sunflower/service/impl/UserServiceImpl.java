package com.sunflower.service.impl;

import java.util.List;

import com.sunflower.dao.UserDao;
import com.sunflower.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunflower.entity.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao<User> dao;
	
	public boolean doUserLogin(User user) {
		List<User> list = dao.selectId(user.getUsername());
		if(list.size() == 0){
			return false;
		}else{
			if(list.get(0).getPassword().equals(user.getPassword())){				
				return true;
			}else{
				return false;
			}			
		}
	}	
}
