package com.project.exercise.controller;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.exercise.dto.ExerciseLibDTO;
import com.project.exercise.service.ExerciseLibService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
@RequestMapping("/exlib")
@RequiredArgsConstructor
public class ExerciseLibController {
	
	private final ExerciseLibService exerciseLibService;
	

	@Value("${exerciselib.imgdir}")
	String imgdir;
	
	
	@GetMapping
	public String getLibraries(Model model) {
		List<ExerciseLibDTO> list = null;
		try {
			list = exerciseLibService.getAllExerciseLib();
			model.addAttribute("elist", list);
			log.info(model);
		} catch(Exception e) {
			log.error(e.getMessage());
			log.warn("라이브러리 로드 과정에서 문제 발생");
		}
		
		
		return "/exercise-lib";
	}
	

	@GetMapping("/login")
	public String getKakaoLogin() {
		return "/login-example";
	}
		
	@GetMapping("/api/{elid}")
	@ResponseBody
	public String updateOneBookmark(@PathVariable("elid") int elid) {
		
		String result = null;
		
		try {
			result = exerciseLibService.updateBookmark(elid);
		} catch(Exception e) {
			log.error(e.getMessage());
			log.warn("라이브러리 로드 과정에서 문제 발생");
		}
		return result;
	}
	
	
}
