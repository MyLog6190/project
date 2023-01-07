package com.project.program.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.program.controller.ProgramController;
import com.project.program.dto.ProgramDTO;
import com.project.program.dto.ProgramExerciseDTO;
import com.project.program.mapper.ProgramMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor
@Transactional
@Log4j2
public class ProgramServiceImpl implements ProgramService {
	
	private final ProgramMapper programMapper;

	@Override
	public List<ProgramDTO> getAllProgram() {
		List<ProgramDTO> pList = programMapper.getAllProgram();
		return pList;
	}

	@Override
	public ProgramDTO getProgram(String pNo) {
		ProgramDTO program = null;
		
		try {
			program = programMapper.getProgram(pNo);
		}catch (Exception e) {
			log.error(e);
		}
		
		System.out.println(program);
		return program;
	}

	@Override
	public List<ProgramExerciseDTO> getProgramExercises(String pNo) {
		List<ProgramExerciseDTO> exercises = null;
		
		try {
			exercises = programMapper.getProgramExercises(pNo);
		}catch (Exception e) {
			log.error(e);
		}
		
		return exercises;
	}

}