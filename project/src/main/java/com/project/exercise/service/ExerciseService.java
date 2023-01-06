package com.project.exercise.service;

import java.util.List;

import com.project.exercise.dto.BookmarkDTO;
import com.project.exercise.dto.ExerciseDTO;


public interface ExerciseService {

	List<ExerciseDTO> getAllExercise();
	
//	ExerciseDTO getOneExercise(String e_no);
	
	String updateBookmark(String user_id, String e_no);
	
	List<BookmarkDTO> getAllBookmark(String user_id);
	
}
