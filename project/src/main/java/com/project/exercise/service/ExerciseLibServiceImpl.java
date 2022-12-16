package com.project.exercise.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.exercise.dto.ExerciseLibDTO;
import com.project.exercise.mapper.ExerciseLibMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class ExerciseLibServiceImpl implements ExerciseLibService {

	private final ExerciseLibMapper exerciseLibMapper;
	
	@Override
	public List<ExerciseLibDTO> getAll() {
		List<ExerciseLibDTO> elList = exerciseLibMapper.getAll();
		
		return elList;
	}

}
