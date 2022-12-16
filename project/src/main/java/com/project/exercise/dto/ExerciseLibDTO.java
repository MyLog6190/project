package com.project.exercise.dto;


import lombok.*;


@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ExerciseLibDTO {
	private String eNo;
	
	private String eName;
	
	private String cNo;
	
	private String ePhoto;
	
	private String eContent;
}