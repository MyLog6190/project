package com.project.exercise.controller;



import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.project.common.config.auth.PrincipalDetail;
import com.project.exercise.dto.ExerciseDTO;
import com.project.exercise.dto.ExercisePlanDTO;
import com.project.exercise.dto.ExerciseVolumeDTO;
import com.project.exercise.service.ExercisePlanService;
import com.project.exercise.service.ExerciseService;
import com.project.program.dto.ProgramDTO;
import com.project.program.dto.ProgramExerciseDTO;
import com.project.program.service.ProgramService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
@RequestMapping("/exercise")
@RequiredArgsConstructor
public class ExercisePlanController {
	
	private final ExerciseService exerciseLibService;
	private final ExercisePlanService exercisePlanService;
	private final ProgramService programService;
	
	@GetMapping("/plan")
	public String calendar(Model model) {
		return "/exercise/plan";
	}
	
	@PostMapping("/plan")
	public void showExerciseShow(@RequestBody Map<String, String> date, HttpServletResponse response, @AuthenticationPrincipal PrincipalDetail principal) {
		List<ExercisePlanDTO> eplist = new ArrayList<>();
		List<ExerciseVolumeDTO> evlist = new ArrayList<>();
		String r_date = date.get("date").toString();
		String user_id = principal.getUsername();
		
		eplist = exercisePlanService.selectExercisePlan(r_date, user_id);
		evlist = exercisePlanService.selectExerciseVolume(r_date, user_id);
		
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
	public void exerciseList(HttpServletResponse response) {
		List<ExerciseDTO> list = null;
		try {
			list = exerciseLibService.getAllExercise();
		} catch(Exception e) {
			log.error(e.getMessage());
			log.info("라이브러리 로드 과정에서 문제 발생");
		}
		
		try {
			new Gson().toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/select-exercise")
	public void selectExercise(@RequestBody Map<String, Object> pr ,HttpServletResponse response, @AuthenticationPrincipal PrincipalDetail principal) {
		List<ExercisePlanDTO> list = new ArrayList<>();
		ExercisePlanDTO exercisePlanDTO = null;
		String[] eNoList = pr.get("enoList").toString().replace("[", "").replace("]","").replace(" ", "").split(",");
		String[] rDateList = pr.get("dateList").toString().replace("[", "").replace("]","").replace(" ", "").split(",");
		String user_id = principal.getUsername();
		
		for(int i = 0; i < eNoList.length; i++) {
			exercisePlanDTO = new ExercisePlanDTO();
			exercisePlanDTO.setE_no(eNoList[i]);
			exercisePlanDTO.setR_date(rDateList[i]);
			list.add(exercisePlanDTO);
		}
		
		exercisePlanService.insertExercisePlan(list,user_id);
	}
	
	@PostMapping("/volume_delete")
	public void deleteVolume(@RequestBody Map<String, String> vNo  ,HttpServletResponse response) {
		String v_no = vNo.get("vNo").toString();
		exercisePlanService.deleteVolume(v_no);
	}
	
	@PostMapping("/recode_delete")
	public void deleteRecode(@RequestBody Map<String, String> rNo  ,HttpServletResponse response) {
		String r_no = rNo.get("rNo").toString();
		exercisePlanService.deleteRecode(r_no);
	}
	
	@PostMapping("/insert_volume")
	public void insertVolume(@RequestBody Map<String, String> rNo  ,HttpServletResponse response) {
		String r_no = rNo.get("rNo").toString();
		exercisePlanService.insertExerciseVolume(r_no);
	}
	
	@PostMapping("/res_update")
	public void updateReps(@RequestBody Map<String, String> data  ,HttpServletResponse response) {
		String vNo = data.get("vNo").toString();
		String repsValue = data.get("repsValue").toString();
		
		try {
			exercisePlanService.updateReps(vNo, repsValue);
		}catch(Exception e) {
			log.error(e.getMessage());
		}
	}
	
	@PostMapping("/kg_update")
	public void updateKg(@RequestBody Map<String, String> data  ,HttpServletResponse response) {
		String vNo = data.get("vNo").toString();
		String kgValue = data.get("kgValue").toString();
		exercisePlanService.updateKg(vNo, kgValue);
	}
	
	@PostMapping("/do_check")
	public void updateChecked(@RequestBody Map<String, String> data  ,HttpServletResponse response) {
		String vNo = data.get("vNo").toString();
		String checkValue = data.get("checkValue").toString();
		exercisePlanService.updateChecked(vNo, checkValue);
	}
	
	@PostMapping("/workout_day")
	public void workoutDay(HttpServletResponse response, @AuthenticationPrincipal PrincipalDetail principal) {
		ArrayList<String> r_date = null;
		String user_id = principal.getUsername();
		r_date = exercisePlanService.workoutDay(user_id);
		
		try {
			new Gson().toJson(r_date,response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/program")
	public void getPrograms(HttpServletResponse response) {
		List<ProgramDTO> pList = programService.getAllProgram();
		
		try {
			new Gson().toJson(pList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/program-exercises")
	public void getProgramsExerciseList(@RequestBody Map<String, String> data, HttpServletResponse response) {
		String pNo = data.get("pNo");
		List<ProgramExerciseDTO> pList = programService.getProgramExercises(pNo);
		
		try {
			new Gson().toJson(pList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/insert-exercise-plan")
	public void insertExercisePlan(@RequestBody Map<String, Object> data, HttpServletResponse response, @AuthenticationPrincipal PrincipalDetail principal) {
		String[] eNoList = data.get("eNoList").toString().replace("[", "").replace("]","").replace(" ", "").split(",");
		String[] rDateList = data.get("dateList").toString().replace("[", "").replace("]","").replace(" ", "").split(",");
		String[] pSetList = data.get("pSetList").toString().replace("[", "").replace("]","").replace(" ", "").split(",");
		String[] pRepsList = data.get("pRepsList").toString().replace("[", "").replace("]","").replace(" ", "").split(",");
		String[] pKgList = data.get("pKgList").toString().replace("[", "").replace("]","").replace(" ", "").split(",");
		String user_id = principal.getUsername();
		
		List<ExercisePlanDTO> list = new ArrayList<>();
		ExercisePlanDTO exercisePlanDTO = null;

		for(int i = 0; i < eNoList.length; i++) {
			exercisePlanDTO = new ExercisePlanDTO();
			exercisePlanDTO.setUser_id(user_id);
			exercisePlanDTO.setE_no(eNoList[i]);
			exercisePlanDTO.setR_date(rDateList[i]);
			list.add(exercisePlanDTO);
		}
		
		exercisePlanService.insertExercisePlan(list, pSetList, pRepsList, pKgList);
	}
	
	
}
