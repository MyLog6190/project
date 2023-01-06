package com.project.user.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.user.dto.NaverProfile;
import com.project.user.dto.OAuthTokenNaver;
import com.project.user.dto.UserDTO;
import com.project.user.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;


@RequiredArgsConstructor
@Controller
@Log4j2
@RequestMapping("/auth")
public class NaverController {

	private final UserService userService;
	
	private final AuthenticationManager authenticationManager;
		
	private OAuthTokenNaver oauthToken;
	
	
	@GetMapping("/naver/logout")
	public String naverLogout(Model model) {
	
//		RestTemplate rt = new RestTemplate();
//		
//		// HttpHeader 오브젝트 생성
//		HttpHeaders naverAccessTokenRequestHeader = new HttpHeaders();
//		naverAccessTokenRequestHeader.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//				//"Authorization", "Bearer "+oauthToken.getAccess_token());
//
//		
//		// Http Body 오브젝트 생성
//		MultiValueMap<String, String> naverAccessTokenRequestBody = new LinkedMultiValueMap<>();
//		naverAccessTokenRequestBody.add("grant_type", "delete");
//		naverAccessTokenRequestBody.add("client_id", "3deOKKZcoWV8i0SQ0ubJ");
//		naverAccessTokenRequestBody.add("client_secret", "Q49scyw2u3");
//		naverAccessTokenRequestBody.add("access_token", oauthToken.getAccess_token());
//		naverAccessTokenRequestBody.add("service_provider", "NAVER");
//
//		
//		HttpEntity<MultiValueMap<String, String>> naverAccessTokenDeleteRequest = new HttpEntity<>(naverAccessTokenRequestBody, naverAccessTokenRequestHeader);
//		
//		rt.exchange("https://nid.naver.com/oauth2.0/token", HttpMethod.POST,
//				naverAccessTokenDeleteRequest, String.class);
//		
		String msg="정상적으로 로그아웃 되었습니다.";
		String red="/logout";
		model.addAttribute("msg",msg);
		model.addAttribute("redirect", red);
		return "/alert";
	}
	
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping("/naver/callback")
	public String callbackNaver(Model model, String code, String state)
			throws Exception {

			RestTemplate rt = new RestTemplate();

			// HttpHeader 오브젝트 생성
			HttpHeaders naverAccessTokenRequestHeader = new HttpHeaders();
			naverAccessTokenRequestHeader.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

			// Http Body 오브젝트 생성
			MultiValueMap<String, String> naverAccessTokenRequestBody = new LinkedMultiValueMap<>();
			naverAccessTokenRequestBody.add("grant_type", "authorization_code");
			naverAccessTokenRequestBody.add("client_id", "3deOKKZcoWV8i0SQ0ubJ");
			naverAccessTokenRequestBody.add("client_secret", "Q49scyw2u3");
			naverAccessTokenRequestBody.add("code", code);
			naverAccessTokenRequestBody.add("state", state);
		   
			HttpEntity<MultiValueMap<String, String>> naverAccessTokenRequest = new HttpEntity<>(naverAccessTokenRequestBody, naverAccessTokenRequestHeader);
		   
			ResponseEntity<String> response = rt.exchange("https://nid.naver.com/oauth2.0/token", HttpMethod.POST,
					naverAccessTokenRequest, String.class);

			
			oauthToken = new ObjectMapper().readValue(response.getBody(), OAuthTokenNaver.class);
	      
	      
			// oauth Token 받은 후 액세스 토큰 요청

			RestTemplate rt2 = new RestTemplate();

			// HttpHeader 오브젝트 생성
			HttpHeaders naverProfileRequestHeader = new HttpHeaders();
			naverProfileRequestHeader.add("Authorization", "Bearer " + oauthToken.getAccess_token());

			// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
			HttpEntity<MultiValueMap<String, String>> naverProfileRequest = new HttpEntity<>(naverProfileRequestHeader);

			ResponseEntity<String> naverProfileResponse = rt2.exchange("https://openapi.naver.com/v1/nid/me", HttpMethod.GET,
					naverProfileRequest, String.class);

			

			NaverProfile naverProfile = new ObjectMapper().readValue(naverProfileResponse.getBody(), NaverProfile.class);
	      
			log.info(naverProfile);
			
			String password = naverProfile.getResponse().getId().toString();
			
			String gender;
			
			if(naverProfile.getResponse().getGender().equals("M")) {
				gender = "male";
			} else {
				gender = "female";
			}
			
			UserDTO naverUser = UserDTO.builder()
					.user_id(naverProfile.getResponse().getEmail()+"_"+naverProfile.getResponse().getId())
					.password(password)
					.name(naverProfile.getResponse().getName())
					.login_group("naver")
					.sex(gender)
					.profile_image(naverProfile.getResponse().getProfile_image())
					.role("USER")
					.build();
			
			
			// 가입자, 비가입자 체크
			UserDTO originUser = userService.findUser(naverUser.getUser_id());
			// 없는 유저면
			if (originUser == null) {
				log.info("없는 유저입니다.");
				log.info("회원가입 처리 됩니다.");
				userService.userSignUp(naverUser);
			}
			
			
	      
			// 로그인 처리 log.info("로그인 완료");
			Authentication authentication = authenticationManager.authenticate(
					new UsernamePasswordAuthenticationToken(naverUser.getUser_id(), password));
			SecurityContextHolder.getContext().setAuthentication(authentication);
			
			
			return "redirect:/";
	   }
	
}
