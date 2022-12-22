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
	public void userSignUp(UserDTO userDTO) {
		String rawPassword = userDTO.getPassword();
		String encPassword = encoder.encode(rawPassword); 
		userDTO.setPassword(encPassword);
		userDTO.setRole("USER");
		userMapper.userSignUp(userDTO);
	}

	@Override
	@Transactional(readOnly = true) // Select 할 때 트랜잭션 시작, 서비스 종료 시에 트랜잭션 종료(정합성)
	public UserDTO userLogin(UserDTO userDTO) {

		return userMapper.userLogin(userDTO.getUser_id(), userDTO.getPassword());
	}

	@Override
	public void userUpdate(UserDTO userDTO) {
		UserDTO findUser = userMapper.findByUser_id(userDTO.getUser_id());
		
		if(findUser == null) {
			log.info("회원 찾기 실패");
			return;
		}
		
		String rawPassword = userDTO.getPassword();
		String encPassword = encoder.encode(rawPassword); 
		findUser.setPassword(encPassword);
		//findUser.setName(user.getName());
		
		//세션 등록
		
		userMapper.userUpdate(findUser);
		
	}

	
	
	
}
