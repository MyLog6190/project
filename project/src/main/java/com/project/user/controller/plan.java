package com.project.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/plan")
public class plan {
	@GetMapping("/a")
	public String hello() {
		return "/exercise-plan";
	}
	
	@GetMapping("/b")
	public String hello2(@RequestParam("code") String code) {
		System.out.println(code);
		return "/exercise-plan";
	}
}
