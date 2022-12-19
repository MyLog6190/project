package com.project.user.service;

import com.project.user.dto.User;

public interface UserService {
	
	User findUser(String user_id);
	
	void userSignUp(User user);
	
	User login(User user);

	void userUpdate(User user);
}
