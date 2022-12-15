package com.project.exercise.contoller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.user.dto.ExerciseLibDTO;
import com.project.user.service.ExerciseLibService;

import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
@RequestMapping("/exercise")
public class ExercisePlan {
	
	@GetMapping("/plan")
	public String hello(Model model) {
		
		return "/exercise-plan";
	}
	
	@GetMapping("/b")
	public String hello2(@RequestParam("code") String code) {
		System.out.println(code);
		return "/exercise-plan";
	}
}
