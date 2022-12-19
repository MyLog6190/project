package com.project.user.mapper;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.project.user.dto.User;

@Repository
@MapperScan
public interface UserMapper {
	User findByUser_id(String user_id);
	
	void userSignUp(User user);
	
	User login(String user_id, String password);
	
	void userUpdate(User user);
}
