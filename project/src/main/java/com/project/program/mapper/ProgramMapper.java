package com.project.program.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.project.program.dto.ProgramDTO;
import com.project.program.dto.ProgramExerciseDTO;


@Repository
@MapperScan
public interface ProgramMapper {

List<ProgramDTO> getAllProgram();

ProgramDTO getProgram(String pNo);

List<ProgramExerciseDTO> getProgramExercises(String pNo);

}