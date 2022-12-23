package com.project.exercise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.common.config.auth.PrincipalDetail;
import com.project.exercise.dto.BookmarkDTO;
import com.project.exercise.dto.ExerciseDTO;
import com.project.exercise.service.ExerciseService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
@RequestMapping("/exlib")
@RequiredArgsConstructor
public class ExerciseLibController {
	
	private final ExerciseService exerciseService;

	//private final AuthenticationManager authenticationManager;

	@Value("${exercise.imgdir}")
	String imgdir;
	
	
	@GetMapping
	public String getLibraries(@AuthenticationPrincipal PrincipalDetail principal, Model model) {
		List<ExerciseDTO> list = null;
		List<BookmarkDTO> bList = null;
		String user_id = principal.getUsername();
		try {
			list = exerciseService.getAllExercise();
			bList = exerciseService.getAllBookmark(user_id);
			model.addAttribute("elist", list);
			model.addAttribute("bookmark", bList);
		} catch(Exception e) {
			log.error(e.getMessage());
			log.warn("라이브러리 로드 과정에서 문제 발생");
		}
		
		return "/exercise-lib";
	}


	@GetMapping("/api/{e_no}")
	@ResponseBody
	public String updateOneBookmark(@AuthenticationPrincipal PrincipalDetail principal,
			@PathVariable("e_no") String e_no) {
		String user_id = principal.getUsername();
				
		String result = null;
		
		try {
			result = exerciseService.updateBookmark(user_id, e_no);
		} catch(Exception e) {
			log.error(e.getMessage());
			log.warn("북마크 업데이트 과정에서 문제 발생");
		}
		return result;
	}
	
	
}
