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
		//@AuthenticationPrincipal -> 로그인 돼 있는지 확인 가능하도록 어노테이션 설정 후 PrincipalDetail를 만들면 거기서 getUsername()으로 아이디 정보 확인 가능!!
		if(principal !=null)
			log.info("로그인 사용자 아이디: " +principal.getUsername());
		else
			log.info("로그인 되지 않음");
		return "/home";
	}
}
