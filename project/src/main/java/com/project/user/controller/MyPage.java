package com.project.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class  MyPage{
	
	@GetMapping("/my")
	public String libraries() {
		return "mypage";
	}
}
