package com.project.exercise.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ExerciseDTO {
	// E_NO, E_NAME, E.C_NO, C_NAME, E_IMG, E_CONTENT
	private String e_no;
	private String e_name;
	private String c_no;
	private String c_name;
	private String e_img;
	private String e_content;
}

