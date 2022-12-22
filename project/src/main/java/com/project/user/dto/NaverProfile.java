package com.project.user.dto;

import lombok.Data;

@Data
public class NaverProfile {

	private String resultcode;
	private String message;
	private Response response;

	
	@Data
	public class Response {

		private String id;
		private String profile_image;
		private String gender;
		private String email;
		private String name;

	}

}
