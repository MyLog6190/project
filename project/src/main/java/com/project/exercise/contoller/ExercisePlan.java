package com.project.exercise.contoller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.exercise.dto.ExerciseLibDTO;
import com.project.exercise.service.ExerciseLibService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
@RequestMapping("/exercise")
@RequiredArgsConstructor
public class ExercisePlan {
	
	private final ExerciseLibService exerciseLibService ;
	
	@GetMapping("/plan")
	public String hello(Model model) {
		List<ExerciseLibDTO> list = null;
		try {
			list = exerciseLibService.getAll();
			model.addAttribute("ellist", list);
			log.info(model);
		} catch(Exception e) {
			log.error(e.getMessage());
			log.info("라이브러리 로드 과정에서 문제 발생");
		}
		return "/exercise-plan";
	}
	
	@GetMapping("/b")
	public String hello2(@RequestParam("code") String code) {
		System.out.println(code);
		return "/exercise-plan";
	}
}
