package com.project.exercise.service;

import java.util.List;

import com.project.exercise.dto.ExercisePlanDTO;
import com.project.exercise.dto.ExerciseVolumeDTO;

public interface ExercisePlanService {
	int insertExercisePlan(List<ExercisePlanDTO> list, String user_id);

	List<ExercisePlanDTO> selectExercisePlan(String r_date);

	void deleteVolume(String v_no);

	List<ExerciseVolumeDTO> selectExerciseVolume(String r_date);

	void deleteRecode(String r_no, String user_id);

	void insertExerciseVolume(String r_no);

	void insert_volume(String r_no);

	void updateDoCheck(String vNo, String checkValue);

	void updateReps(String vNo, String repsValue);

	void updateKg(String vNo, String kgValue);

	void updateChecked(String vNo, String checkValue); 
}
