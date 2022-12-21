package com.project.exercise.mapper;

import java.util.List;

import com.project.exercise.dto.ExercisePlanDTO;
import com.project.exercise.dto.ExerciseVolumeDTO;
import com.project.exercise.dto.test;

public interface ExercisePlanMapper {
	int insertSelectExercise(ExercisePlanDTO dto);

	String selectSeq();

	int insertExerciseVolume(ExerciseVolumeDTO volume);

	List<ExercisePlanDTO> selectPr(String date);

	List<ExerciseVolumeDTO> selectVolume(String date);

	List<ExercisePlanDTO> selectExercisePlan(String r_date);

	int deleteVolume(String v_no);

	List<ExerciseVolumeDTO> selectExerciseVolume(String r_date);

	void deleteRecode(String r_no);

	int insertExerciseVolume(String r_no);

}
