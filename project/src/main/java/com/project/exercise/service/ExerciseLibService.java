package com.project.exercise.service;

import java.util.List;

import com.project.exercise.dto.ExerciseLibDTO;


public interface ExerciseLibService {

	List<ExerciseLibDTO> getAllExerciseLib();
	
	ExerciseLibDTO getOneExerciseLib(int elid);
	
	String updateBookmark(int elid);
	
}
