package com.project.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/community")
@RequiredArgsConstructor
@Log4j2
public class communityController {
	
	@GetMapping
	public String getPost() {
		return "/community/list";
	}
	
	@GetMapping("/post")
	public String post() {
		return "/community/post";
	}
}
