package com.project.common.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.project.common.config.auth.PrincipalDetailService;


@Configuration
@EnableWebSecurity // 스프링 시큐리티에 필터를 거는 것
@EnableGlobalMethodSecurity(prePostEnabled = true) // 특정 주소로 접근 시 권한 및 인증을 미리 체크
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private PrincipalDetailService principalDetailService;
	
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}

	@Bean
	public BCryptPasswordEncoder encodePWD() {
		return new BCryptPasswordEncoder();
	}
	
	// 시큐리티가 대신 로그인해주는데 password를 가로채는데
	// 해당 password가 뭘로 hash가 돼서 회원가입이 되었는지
	// 적용해주기
	// 같은 hash로 암호화해서 DB에 있는 hash랑 비교가능
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(principalDetailService) // 로그인을 진행하는 곳
			.passwordEncoder(encodePWD());
	}
	
	
	
	//login logout 처리 부분
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf().disable() // 테스트할 때는 CSRF 토큰 비활성화
			.authorizeHttpRequests()
				.antMatchers("/", "/css/**", "/icons/**",
						"/images/**", "/views/**", "/bootstrap/**",

						"/auth/**", "/common/**", "/exlib/**", "/board", "/exercise/*", "/home/*") // 로그인 없이 접근 가능하도록 링크 설정해주기

//					"/auth/**", "/common/**", "/board") // 로그인 없이 접근 가능하도록 링크 설정해주기

				.permitAll()
				.anyRequest()
				.authenticated()
			.and()
				.formLogin()
				.loginPage("/auth/login")// 스프링 시큐리티가 해당 주소로 요청 오는 로그인을 가로채서 대신 로그인
				.defaultSuccessUrl("/")
			.and()
				.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/");
		
	}

}
