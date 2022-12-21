package com.project.exercise.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.exercise.dto.ExercisePlanDTO;
import com.project.exercise.dto.ExerciseVolumeDTO;
import com.project.exercise.dto.test;
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
	public int insertExercisePlan(List<ExercisePlanDTO> list) {
		
		for(ExercisePlanDTO dto : list) {
			String r_no = exercisePlanMapper.selectSeq();
			dto.setR_no(r_no);
			System.out.println(r_no);
			System.out.println(dto);
			int result = exercisePlanMapper.insertSelectExercise(dto);
			System.out.println(result);
			
			ExerciseVolumeDTO volume = new ExerciseVolumeDTO();
			volume.setR_no(r_no);
			
			int result2 = exercisePlanMapper.insertExerciseVolume(volume);
			System.out.println(result2);
			
		}
		
		return 0;
	}

	@Override
	public List<ExercisePlanDTO> selectExercisePlan(String r_date) {
		List<ExercisePlanDTO> list = exercisePlanMapper.selectExercisePlan(r_date);
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
	public List<ExerciseVolumeDTO> selectExerciseVolume(String r_date) {
		List<ExerciseVolumeDTO> list = exercisePlanMapper.selectExerciseVolume(r_date);
		return list;
	}

	@Override
	public void deleteRecode(String r_no) {
		exercisePlanMapper.deleteRecode(r_no);
	}

	@Override
	public void insert_volume(String r_no) {
		
		
	}

	@Override
	public void insertExerciseVolume(String r_no) {
		int result = exercisePlanMapper.insertExerciseVolume(r_no);
	}

}
