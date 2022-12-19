package com.project.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class home {
	
	@GetMapping("/")
	public String mainPage() {
		return "home";
	}
	
	@GetMapping("/program")
	public String mainPage2() {
		return "exercise-program";
	}
	
	@GetMapping("/program-detail")
	public String mainPage3() {
		return "program-detail";
	}
}