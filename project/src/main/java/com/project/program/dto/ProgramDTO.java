package com.project.program.dto;

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
	private String p_no;
	private String p_name;
	private String p_level;
	private String p_contents;
	private String p_img;
}
