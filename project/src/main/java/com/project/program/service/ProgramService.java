package com.project.program.service;

import java.util.List;

import com.project.exercise.dto.ExerciseDTO;
import com.project.program.dto.ProgramDTO;
import com.project.program.dto.ProgramExerciseDTO;

public interface ProgramService {
	
	List<ProgramDTO> getAllProgram();

	ProgramDTO getProgram(String pNo);

	List<ProgramExerciseDTO> getProgramExercises(String pNo);


}
