package com.project.exercise.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.project.exercise.dto.ExerciseLibDTO;
import com.project.exercise.dto.ExercisePlanDTO;
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
	public String calendar(Model model) {
		return "/exercise-plan";
	}
	
	@PostMapping("/exercise-list")
	public void ExerciseList(HttpServletResponse response) {
		List<ExerciseLibDTO> list = null;
		try {
			list = exerciseLibService.getAllExerciseLib();
		} catch(Exception e) {
			log.error(e.getMessage());
			log.info("라이브러리 로드 과정에서 문제 발생");
		}
		try {
			new Gson().toJson(list,response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/select-exercise")
	public void SelectExercise(@RequestBody Map<String, Object> pr ,HttpServletResponse response) {
		List<ExercisePlanDTO> list = null;
		
	}
}
