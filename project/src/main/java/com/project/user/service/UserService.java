package com.project.user.service;

import com.project.user.dto.UserDTO;

public interface UserService {
	
	UserDTO findUser(String user_id);
	
	void userSignUp(UserDTO user);
	
	UserDTO userLogin(UserDTO user);

	void userUpdate(UserDTO user);
}
