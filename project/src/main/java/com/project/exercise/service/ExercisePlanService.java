package com.project.exercise.service;

import java.util.ArrayList;
import java.util.List;

import com.project.exercise.dto.ExercisePlanDTO;
import com.project.exercise.dto.ExerciseVolumeDTO;

public interface ExercisePlanService {
	// 자신이 선택한 운동 계획 삽입
	void insertExercisePlan(List<ExercisePlanDTO> list, String user_id);
	
	// 프로그램 운동 계획 삽입
	void insertExercisePlan(List<ExercisePlanDTO> list, String[] pSetList, String[] pRepsList, String[] pKgList); 
	
	// 운동 계획 가져오기
	List<ExercisePlanDTO> selectExercisePlan(String r_date, String user_id);
	
	// 운동 볼륨 가져오기
	List<ExerciseVolumeDTO> selectExerciseVolume(String r_date, String user_id);
	
	// 운동 볼륨 삭제
	void deleteVolume(String v_no);
	
	// 운동 볼륨 추가
	void insertExerciseVolume(String r_no);
	
	// 운동 계획 기록 삭제
	void deleteRecode(String r_no);
	
	// 운동 계획 실행 여부 체크
	void updateChecked(String vNo, String checkValue);
	
	// 온동 반복수 변경
	void updateReps(String vNo, String repsValue);
	
	// 운동 무게 변경
	void updateKg(String vNo, String kgValue);

	// 운동 계획 날짜 불러오기
	ArrayList<String> workoutDay(String user_id);

	
}
