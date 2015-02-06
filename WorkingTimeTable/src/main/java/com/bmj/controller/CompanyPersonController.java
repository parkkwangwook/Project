package com.bmj.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bmj.entity.CompanyPerson;

@Controller
public class CompanyPersonController {
	
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(CompanyPersonController.class);
	}
	
	@RequestMapping(value = "/webProject/...?")
	public String addPerson(Model model) {
		model.addAttribute("addPerson", new CompanyPerson());
		return "";
	}
	
	
}

