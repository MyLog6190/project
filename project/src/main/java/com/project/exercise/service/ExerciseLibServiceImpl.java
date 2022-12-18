package com.project.exercise.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.exercise.dto.ExerciseLibDTO;
import com.project.exercise.mapper.ExerciseLibMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class ExerciseLibServiceImpl implements ExerciseLibService {

	private final ExerciseLibMapper exerciseLibMapper;
	
	@Override
	public List<ExerciseLibDTO> getAllExerciseLib() {
		List<ExerciseLibDTO> elList = exerciseLibMapper.getAllExerciseLib();
		
		return elList;
	}

	@Override
	public ExerciseLibDTO getOneExerciseLib(int elid) {
		ExerciseLibDTO elDTO = exerciseLibMapper.getOneExerciseLib(elid);
		return elDTO;
	}

	@Override
	public String updateBookmark(int elid) {
		exerciseLibMapper.updateBookmark(elid);
		return "update done";
	}
}
