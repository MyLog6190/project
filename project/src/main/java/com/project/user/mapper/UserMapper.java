package com.project.user.mapper;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.project.user.dto.UserDTO;

@Repository
@MapperScan
public interface UserMapper {
	UserDTO findByUser_id(String user_id);
	
	void userSignUp(UserDTO user);
	
	UserDTO userLogin(String user_id, String password);
	
	void userUpdate(UserDTO user);
}
