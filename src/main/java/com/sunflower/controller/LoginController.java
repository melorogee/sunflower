package com.sunflower.controller;

import com.sunflower.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunflower.entity.User;

@Controller
@RequestMapping("/test") 
public class LoginController {
	@Autowired
	private UserServiceImpl userService;

	@RequestMapping("/index.do") //url
	public String test(User user, Model model){
			return "/index_1";
	}

	@RequestMapping("/list.do") //url
	public String list(User user, Model model){
		return "jsp/metaList";
	}
@RequestMapping("/dologin.do") //url
public String dologin(User user, Model model){
	if(userService.doUserLogin(user)){
		model.addAttribute("successMsg", "测试");//
		model.addAttribute("name", user.getUsername());
		return "/success";//测试111
	}else{
		model.addAttribute("failMsg", "测试");
		return "/fail";
	}	
}
}
