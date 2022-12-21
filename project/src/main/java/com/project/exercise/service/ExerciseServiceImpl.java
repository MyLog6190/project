package com.project.exercise.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.exercise.dto.BookmarkDTO;
import com.project.exercise.dto.ExerciseDTO;
import com.project.exercise.mapper.ExerciseMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor
@Transactional
public class ExerciseServiceImpl implements ExerciseService {

	private final ExerciseMapper exerciseMapper;
	
	@Override
	public List<ExerciseDTO> getAllExercise() {
		List<ExerciseDTO> eList = exerciseMapper.getAllExercise();
		
		return eList;
	}

	@Override
	public ExerciseDTO getOneExercise(String e_no) {
		ExerciseDTO elDTO = exerciseMapper.getOneExercise(e_no);
		return elDTO;
	}

	@Override
	public String updateBookmark(String user_id, String e_no) {
		BookmarkDTO bookmarkDTO = new BookmarkDTO(user_id, e_no);
		if(exerciseMapper.getOneBookmark(bookmarkDTO) == null) {
			exerciseMapper.insertBookmark(bookmarkDTO);
		} else {
		 exerciseMapper.deleteBookmark(bookmarkDTO); 
		}
		 
		return "update done";
	}

	@Override
	public List<BookmarkDTO> getAllBookmark(String user_id) {
		List<BookmarkDTO> bList = exerciseMapper.getAllBookmark(user_id);
		return bList;
	}


	
	
}
