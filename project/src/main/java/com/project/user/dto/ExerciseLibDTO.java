package com.project.user.dto;


import lombok.*;


@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ExerciseLibDTO {
	private int elid;
	
	private String elName;
	
	private int cid;
	
	private String elImg;
	
	private String elDetail;

}
