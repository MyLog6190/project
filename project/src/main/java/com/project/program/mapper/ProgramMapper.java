package com.project.program.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.project.program.dto.ProgramDTO;


@Repository
@MapperScan
public interface ProgramMapper {

List<ProgramDTO> getAllProgram();

ProgramDTO getOneProgram(String p_no);

}