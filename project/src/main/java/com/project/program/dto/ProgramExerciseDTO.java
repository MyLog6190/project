package com.project.program.dto;

import com.project.exercise.dto.ExerciseDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ProgramExerciseDTO extends ExerciseDTO{
	private int p_set;
	private int p_reps;
	private int p_kg;
}
