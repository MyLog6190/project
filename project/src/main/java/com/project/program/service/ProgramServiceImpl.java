package com.project.program.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.program.dto.ProgramDTO;
import com.project.program.mapper.ProgramMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class ProgramServiceImpl implements ProgramService {
	
	private final ProgramMapper programMapper;

	@Override
	public List<ProgramDTO> getAllProgram() {
		List<ProgramDTO> pList = programMapper.getAllProgram();
		return pList;
	}
	/*
	 * @Override public ProgramDTO getOneProgram(String p_no) { ProgramDTO plDTO =
	 * programMapper.getOneProgram(p_no); return plDTO; }
	 */
}