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
public class ExercisePlanDTO {
	private String user_id;
	private String r_no;
	private String r_date;
	private String c_name;
	private String e_no;
	private String e_name;
	private String e_img;
}
