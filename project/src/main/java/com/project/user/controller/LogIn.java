package com.project.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class  LogIn{
	
	@GetMapping("/log")
	public String libraries() {
		return "login";
	}
}
