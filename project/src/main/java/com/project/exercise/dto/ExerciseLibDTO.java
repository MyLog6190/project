package com.project.exercise.dto;


import lombok.*;


@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ExerciseLibDTO {
	private int elid;
	
	private String elName;
	
	private int cid;
	
	private String cname;
	
	private String elImg;
	
	private String elDetail;

	private boolean bookmark;
}
