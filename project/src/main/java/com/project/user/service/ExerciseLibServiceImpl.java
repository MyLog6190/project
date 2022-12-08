package com.project.user.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.project.user.dto.ExerciseLibDTO;
import com.project.user.mapper.ExerciseLibMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@RequiredArgsConstructor
@org.springframework.transaction.annotation.Transactional
public class ExerciseLibServiceImpl implements ExerciseLibService {

	private final ExerciseLibMapper exerciseLibMapper;
	
	@Override
	public List<ExerciseLibDTO> getAll() {
		List<ExerciseLibDTO> elList = exerciseLibMapper.getAll();
		
		return elList;
	}

}
