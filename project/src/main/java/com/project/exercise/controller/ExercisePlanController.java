package com.project.exercise.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.project.exercise.dto.ExerciseVolumeDTO;
import com.project.exercise.service.ExerciseLibService;
import com.project.exercise.service.ExercisePlanService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
@RequestMapping("/exercise")
@RequiredArgsConstructor
public class ExercisePlanController {
	
	private final ExerciseLibService exerciseLibService ;
	private final ExercisePlanService exercisePlanService;
	
	@GetMapping("/plan")
	public String calendar(Model model) {
		return "/exercise-plan";
	}
	
	@PostMapping("/plan")
	public void ShowExerciseShow(@RequestBody Map<String, String> date, HttpServletResponse response) {
		List<ExercisePlanDTO> eplist = new ArrayList<>();
		List<ExerciseVolumeDTO> evlist = new ArrayList<>();
		String r_date = date.get("date").toString();
		
		try {
			eplist = exercisePlanService.selectExercisePlan(r_date);
			evlist = exercisePlanService.selectExerciseVolume(r_date);
		}catch(Exception e) {
			log.error(e.getMessage());
		}
		
		Map <String, Object> map = new HashMap<>();
		map.put("eplist", eplist);
		map.put("evlist", evlist);
		try {
			new Gson().toJson(map,response.getWriter());
		} catch (JsonIOException | IOException e) {
			log.error(e.getMessage());
			e.printStackTrace();
		}

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
		List<ExercisePlanDTO> list = new ArrayList<>();
		ExercisePlanDTO exercisePlanDTO = null;
		System.out.println(pr.get("eNameList").toString());
		String[] eNoList = pr.get("enoList").toString().replace("[", "").replace("]","").replace(" ", "").split(",");
		String[] eNameList = pr.get("eNameList").toString().replace("[", "").replace("]","").replace(" ", "").split(",");
		String[] cNameList = pr.get("cNameList").toString().replace("[", "").replace("]","").replace(" ", "").split(",");
		String[] eImgList = pr.get("imgList").toString().replace("[", "").replace("]","").replace(" ", "").split(",");
		String[] rDateList = pr.get("dateList").toString().replace("[", "").replace("]","").replace(" ", "").split(",");
		
		for(int i = 0; i < eNoList.length; i++) {
			exercisePlanDTO = new ExercisePlanDTO();
			exercisePlanDTO.setC_name(cNameList[i]);
			exercisePlanDTO.setE_no(eNoList[i]);
			exercisePlanDTO.setE_name(eNameList[i]);
			exercisePlanDTO.setE_img(eImgList[i]);
			exercisePlanDTO.setR_date(rDateList[i]);
			list.add(exercisePlanDTO);
		}
		
		try {
			exercisePlanService.insertExercisePlan(list);
		}catch(Exception e) {
			log.error(e.getMessage());
		}
	}
	
	@PostMapping("/volume_delete")
	public void deleteVolume(@RequestBody Map<String, String> vNo  ,HttpServletResponse response) {
		String v_no = vNo.get("vNo").toString();
		System.out.println(v_no);
		try {
			exercisePlanService.deleteVolume(v_no);
		}catch(Exception e) {
			log.error(e.getMessage());
		}
	}
	
	@PostMapping("/recode_delete")
	public void deleteRecode(@RequestBody Map<String, String> rNo  ,HttpServletResponse response) {
		String r_no = rNo.get("rNo").toString();
		System.out.println(r_no);
		try {
			exercisePlanService.deleteRecode(r_no);
		}catch(Exception e) {
			log.error(e.getMessage());
		}
	}
	
	@PostMapping("/insert_volume")
	public void insertVolume(@RequestBody Map<String, String> rNo  ,HttpServletResponse response) {
		String r_no = rNo.get("rNo").toString();
		System.out.println(r_no);
		try {
			exercisePlanService.insertExerciseVolume(r_no);
		}catch(Exception e) {
			log.error(e.getMessage());
		}
	}
	
	
}
