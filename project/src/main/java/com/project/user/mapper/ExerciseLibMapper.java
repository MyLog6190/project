package com.project.user.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.project.user.dto.ExerciseLibDTO;

@Repository
@MapperScan
public interface ExerciseLibMapper {
	
	List<ExerciseLibDTO> getAll();
}
