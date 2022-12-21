package com.project.user.controller;

import java.io.File;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.user.dto.UserDTO;
import com.project.user.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/auth")
@RequiredArgsConstructor
public class LoginOutController {
	
	@Value("${profile.imgdir}")
	String fdir;
	
	private final UserService userService;
	
	private final AuthenticationManager authenticationManager;
	
	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}
	
	@GetMapping("/loginPage")
	public String loginForm() {
		return "loginForm";
	}
	
	@PostMapping("/normal/login")
	public String normalLogin(@RequestParam String user_id, @RequestParam String password) {
		//로그인 처리
		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user_id, password));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout() {
		return "/";
	}
	
	@GetMapping("/register")
	public String registerForm() {
		return "registerForm";
	}
	
	@PostMapping("/register")
	public String registration(@ModelAttribute UserDTO userDTO, Model model, @RequestParam MultipartFile file) {
		if(userService.findUser(userDTO.getUser_id()) !=null) {
			String msg = "이미 등록된 유저입니다.";
			String red = "/auth/register";
			log.info("이미 등록된 유저입니다.");
			model.addAttribute("msg", msg);
			model.addAttribute("redirect", red);
			return "alert";
		}
		try {
			// 저장 파일 객체 생성
			File dest = new File(fdir+"/"+file.getOriginalFilename());
			// 파일 저장
			file.transferTo(dest);
			userDTO.setProfile_image("/views/images/profileimages/"+dest.getName());
			userService.userSignUp(userDTO);
		}catch(Exception e) {
			log.info("회원 등록 과정에서 문제 발생");
		}
		
		return "redirect:/";
	}
}
