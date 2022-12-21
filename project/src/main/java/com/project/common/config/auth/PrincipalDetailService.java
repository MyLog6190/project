package com.project.common.config.auth;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.user.dto.UserDTO;
import com.project.user.mapper.UserMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Service
@RequiredArgsConstructor
@Log4j2
public class PrincipalDetailService implements UserDetailsService{

	private final UserMapper userMapper;
	
	// 스프링이 로그인 요청이 오면 username, password 변수 2개를 가로채서
	// password 부분 처리는 알아서 함.
	// username이 DB에 있는지 확인해 return
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
		UserDTO principal = userMapper.findByUser_id(user_id);
	
		if(principal == null) {
			log.info("해당 유저를 찾을 수 없습니다. :" + user_id);
		}
		
		return new PrincipalDetail(principal); //시큐리티 세션에 유저 정보 저장
	}
	
}
