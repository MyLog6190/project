package com.project.user.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserDTO {
	private String user_id;
	private String password;
	private String name;
	private int weight;
	private String login_group;
	private String sex;
	private String profile_image;
	private String role;
}
