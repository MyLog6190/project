package com.project.exercise.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.exercise.dto.ExercisePlanDTO;
import com.project.exercise.dto.ExerciseVolumeDTO;
import com.project.exercise.mapper.ExercisePlanMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor
@Transactional
@Log4j2
public class ExercisePlanServiceImpl implements ExercisePlanService{
	
	private final ExercisePlanMapper exercisePlanMapper;
	
	@Override
	public int insertExercisePlan(List<ExercisePlanDTO> list, String user_id) {
		
		for(ExercisePlanDTO dto : list) {
			String r_no = exercisePlanMapper.selectSeq();
			dto.setR_no(r_no);
			dto.setUser_id(user_id);
			System.out.println(dto);
			int result = exercisePlanMapper.insertSelectExercise(dto);
			
			ExerciseVolumeDTO volume = new ExerciseVolumeDTO();
			volume.setR_no(r_no);
			
			int result2 = exercisePlanMapper.insertExerciseVolume(volume);
		}
		
		return 0;
	}

	@Override
	public List<ExercisePlanDTO> selectExercisePlan(String r_date, String user_id) {
		List<ExercisePlanDTO> list = null;
		
		try {
			list = exercisePlanMapper.selectExercisePlan(r_date, user_id);
		}catch (Exception e) {
			log.error(e.getMessage());
		}
		
		return list;
	}

	@Override
	public void deleteVolume(String v_no) {
		try {
			int result = exercisePlanMapper.deleteVolume(v_no);
			System.out.println(result);
		}catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Override
	public List<ExerciseVolumeDTO> selectExerciseVolume(String r_date, String user_id) {
		List<ExerciseVolumeDTO> list = exercisePlanMapper.selectExerciseVolume(r_date, user_id);
		return list;
	}

	@Override
	public void deleteRecode(String r_no) {
		exercisePlanMapper.deleteRecode(r_no);
	}


	@Override
	public void insertExerciseVolume(String r_no) {
		int result = exercisePlanMapper.insertExerciseVolume(r_no);
	}

	@Override
	public void updateDoCheck(String vNo, String checkValue) {
		try {
			exercisePlanMapper.updateDoCheck(vNo, checkValue);		
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Override
	public void updateReps(String vNo, String repsValue) {
		exercisePlanMapper.updateReps(vNo, repsValue);		
	}

	@Override
	public void updateKg(String vNo, String kgValue) {
		exercisePlanMapper.updateKg(vNo, kgValue);		
	}

	@Override
	public void updateChecked(String vNo, String checkValue) {
		exercisePlanMapper.updateChecked(vNo, checkValue);
	}

	@Override
	public ArrayList<String> workoutDay(String user_id) {
		ArrayList<String> r_date = exercisePlanMapper.workoutDay(user_id);
		return r_date;
	}



}
