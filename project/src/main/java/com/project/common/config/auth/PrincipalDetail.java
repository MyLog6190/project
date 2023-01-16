package com.project.common.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.project.user.dto.UserDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


// 스프링 시큐리티가 로그인 요청을 가로채서 로그인을 진행하고 완료가 되면 UserDetails
// 타입의 오브젝트를 스프링 시큐리티의 고유 세션 저장소에 저장을 한다.
// 

@Data
public class PrincipalDetail implements UserDetails {
	
	private UserDTO user; // composition

	public PrincipalDetail(UserDTO user) {
		this.user = user;
	}
	
	

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getUser_id();
	}
	
	public String getName() {
		return user.getName();
	}

	
	//계정이 만료되었는지 리턴
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	//계정이 락이 안 걸렸는지 확인
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	
	// 비밀번호가 만료되지 않았는지 확인
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	
	// 계정의 권한 목록을 리턴, user랑 admin권한이 있을 것이다
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collectors = new ArrayList<>();
		
		
		// ROLE_USER(주어진 권한( ex user권한, admin권한))
		collectors.add(() -> "ROLE_" +user.getRole());
		
		return collectors;
	}


}
