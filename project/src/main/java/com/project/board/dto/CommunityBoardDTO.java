package com.project.board.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommunityBoardDTO {
	private int cb_no;
	private String user_id;
	private String cb_writer;
	private String cb_tag;
	private String cb_title;
	private String cb_content;
	private Date cb_date;
}
