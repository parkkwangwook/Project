package com.bmj.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bmj.entity.Users;
import com.bmj.service.UsersService;

@Controller
/*@RequestMapping("/webProject")*/
public class UsersController {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(UsersController.class);
	}
	
	@Autowired
	UsersService service;
	
	@RequestMapping(value="/count", method = RequestMethod.GET)
	public String getAllDeptList(Model model) {
		Integer result = service.getUsersCount();
		model.addAttribute("message", result);
		return "showMessage";
	}
	
	@RequestMapping(value="/webProject/main")
	public String connectionSite() {
		return "/webProject/intro";
	}

	@RequestMapping(value="/webProject/join")
	public String joinGo() {
		return "/webProject/joinForm";
	}
	
	@RequestMapping(value="/webProject/join", method = RequestMethod.POST)
	public String joinSite(@ModelAttribute("joinUser") Users user) {
		// service.addUser(user);
		return "/webProject/login";
	}
	
	
	
	
	
	
}
