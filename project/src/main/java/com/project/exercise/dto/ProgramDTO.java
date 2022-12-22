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
public class ProgramDTO {
//	program table
private String p_no;
private String p_name;
private String p_cycle;
private String p_contents;
private String p_img;

//	program_exercise table
//private String p_no;
private String e_no;
private String p_type;
private String p_set;
private String p_reps;
private String p_kg;
private String p_rest;


}
