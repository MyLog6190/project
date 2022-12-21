package com.project.exercise.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ExerciseVolumeDTO extends ExercisePlanDTO{
	private String v_no;
	private int v_reps;
	private int v_set;
	private int v_kg;
	private int do_checked;
}
