package com.project.exercise.service;

import java.util.List;

import com.project.exercise.dto.ExercisePlanDTO;
import com.project.exercise.dto.ExerciseVolumeDTO;

public interface Program {
	int insertProgram(List<ProgramDTO> list);
	List<ProgramDTO> selectProgram
	
}

public interface ExercisePlanService {
	int insertExercisePlan(List<ExercisePlanDTO> list);

	List<ExercisePlanDTO> selectExercisePlan(String r_date);

	void deleteVolume(String v_no);

	List<ExerciseVolumeDTO> selectExerciseVolume(String r_date);

	void deleteRecode(String r_no);

	void insertExerciseVolume(String r_no);

	void insert_volume(String r_no);

	void updateDoCheck(String vNo, String checkValue);

	void updateReps(String vNo, String repsValue);

	void updateKg(String vNo, String kgValue); 
}
