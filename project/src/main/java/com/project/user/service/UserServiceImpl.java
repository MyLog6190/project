package com.project.user.service;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.user.dto.UserDTO;
import com.project.user.mapper.UserMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@Transactional
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

	private final UserMapper userMapper;
	
	private final BCryptPasswordEncoder encoder;
	

	@Override
	public UserDTO findUser(String user_id) {

		return userMapper.findByUser_id(user_id);
	}
	
	@Override
	public void userSignUp(UserDTO user) {
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword); 
		user.setPassword(encPassword);
		user.setRole("USER");
		userMapper.userSignUp(user);
	}

	@Override
	@Transactional(readOnly = true) // Select 할 때 트랜잭션 시작, 서비스 종료 시에 트랜잭션 종료(정합성)
	public UserDTO userLogin(UserDTO user) {
		return userMapper.userLogin(user.getUser_id(), user.getPassword());
		
	}

	@Override
	public void userUpdate(UserDTO user) {
		
		UserDTO findUser = userMapper.findByUser_id(user.getUser_id());
		
		if(findUser == null) {
			log.info("회원 찾기 실패");
			return;
		}
		
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword); 
		findUser.setPassword(encPassword);
		//findUser.setName(user.getName());
		
		//세션 등록

		
		userMapper.userUpdate(findUser);
		
	}

	
	
	
}
