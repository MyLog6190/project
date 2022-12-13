package com.project.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/callback")
public class  NaverLoginCallback{
	
	@GetMapping("/")
	public String libraries() {
		return "callback";
	}
}
