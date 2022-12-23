package com.project.program.service;

import java.util.List;

import com.project.program.dto.ProgramDTO;

public interface ProgramService {
	
	List<ProgramDTO> getAllProgram();
	
	ProgramDTO getOneProgram(String p_no);
	
}
