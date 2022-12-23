package com.project.board.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO {
	
	@Builder.Default
	private int page = 1;
	
	private String link;
	
	public int getSkip() {
		return (page -1 ) * 10;
	}
	
	public String getLink() {
		if(link == null) {
			link = new StringBuilder()
					.append("page=" + this.page)
					.toString();
		}
		return link;
	}
}
