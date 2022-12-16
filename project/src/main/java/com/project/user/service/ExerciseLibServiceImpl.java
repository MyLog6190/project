//package com.project.user.service;
//
//import java.util.List;
//
//
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.project.user.dto.ExerciseLibDTO;
//import com.project.user.mapper.ExerciseLibMapper;
//
//import lombok.RequiredArgsConstructor;
//import lombok.extern.log4j.Log4j2;
//
//@Service
//@RequiredArgsConstructor
//@Transactional
//public class ExerciseLibServiceImpl implements ExerciseLibService {
//
//	private final ExerciseLibMapper exerciseLibMapper;
//	
//	@Override
//	public List<ExerciseLibDTO> getAllExerciseLib() {
//		List<ExerciseLibDTO> elList = exerciseLibMapper.getAllExerciseLib();
//		
//		return elList;
//	}
//
//	@Override
//	public ExerciseLibDTO getOneExerciseLib(int elid) {
//		ExerciseLibDTO elDTO = exerciseLibMapper.getOneExerciseLib(elid);
//		return elDTO;
//	}
//
//	@Override
//	public String updateBookmark(int elid) {
//		exerciseLibMapper.updateBookmark(elid);
//		return "update done";
//	}
//
//	
//}
