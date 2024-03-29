package com.project.exercise.mapper;

import java.util.ArrayList;
import java.util.List;

import com.project.exercise.dto.ExercisePlanDTO;
import com.project.exercise.dto.ExerciseVolumeDTO;

public interface ExercisePlanMapper {
	int insertSelectExercise(ExercisePlanDTO dto);

	int insertExerciseVolume(ExerciseVolumeDTO volume);
	
	String selectSeq();

	List<ExercisePlanDTO> selectPr(String date);

	List<ExerciseVolumeDTO> selectVolume(String date);

	List<ExercisePlanDTO> selectExercisePlan(String r_date, String user_id);

	int deleteVolume(String v_no);

	List<ExerciseVolumeDTO> selectExerciseVolume(String r_date, String user_id);

	void deleteRecode(String r_no);

	int insertExerciseVolume(String r_no, int v_reps, int v_kg);

	void updateReps(String vNo, String repsValue);

	void updateKg(String vNo, String kgValue);

	void updateChecked(String vNo, String checkValue);

	ArrayList<String> workoutDay(String user_id);
	
}
