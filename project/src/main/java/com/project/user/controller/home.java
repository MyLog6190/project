package com.project.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class home {
	
	@GetMapping("/in")
	public String mainPage() {
		return "homeLogIn";
	}
	
	@GetMapping("/out")
	public String mainPage2() {
		return "homeLogOut";
	}
}