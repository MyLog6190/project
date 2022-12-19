package com.project.user.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.common.config.auth.PrincipalDetail;

import lombok.extern.log4j.Log4j2;


@Controller
@RequestMapping
@Log4j2
public class Index {
	
	@GetMapping({"","/"})
	public String hello(@AuthenticationPrincipal PrincipalDetail principal) {
		if(principal !=null)
			log.info("로그인 사용자 아이디: " +principal.getUsername());
		else
			log.info("로그인 되지 않음");
		return "/home";
	}
}
