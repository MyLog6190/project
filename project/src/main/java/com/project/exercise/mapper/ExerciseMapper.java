package com.project.exercise.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.project.exercise.dto.BookmarkDTO;
import com.project.exercise.dto.ExerciseDTO;


@Repository
@MapperScan
public interface ExerciseMapper {
	
	List<ExerciseDTO> getAllExercise();
	
	ExerciseDTO getOneExercise(String e_no);
	
	BookmarkDTO getOneBookmark(BookmarkDTO bookmarkDTO);
	
	List<BookmarkDTO> getAllBookmark(String user_id);
	
	void insertBookmark(BookmarkDTO bookmarkDTO);
	
	void deleteBookmark(BookmarkDTO bookmarkDTO);
	

}
