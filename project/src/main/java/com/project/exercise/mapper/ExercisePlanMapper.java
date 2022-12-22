package com.project.exercise.mapper;

import java.util.List;

import com.project.exercise.dto.ExercisePlanDTO;
import com.project.exercise.dto.ExerciseVolumeDTO;

public interface ExercisePlanMapper {
	int insertSelectExercise(ExercisePlanDTO dto, String user_id);

	String selectSeq();

	int insertExerciseVolume(ExerciseVolumeDTO volume);

	List<ExercisePlanDTO> selectPr(String date);

	List<ExerciseVolumeDTO> selectVolume(String date);

	List<ExercisePlanDTO> selectExercisePlan(String r_date);

	int deleteVolume(String v_no);

	List<ExerciseVolumeDTO> selectExerciseVolume(String r_date);

	void deleteRecode(String r_no, String user_id);

	int insertExerciseVolume(String r_no);

	void updateDoCheck(String vNo, String checkValue);

	void updateReps(String vNo, String repsValue);

	void updateKg(String vNo, String kgValue);

	void updateChecked(String vNo, String checkValue);
	
}
