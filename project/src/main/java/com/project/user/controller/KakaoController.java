package com.project.user.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.exercise.service.ExerciseService;
import com.project.user.dto.KakaoProfile;
import com.project.user.dto.OAuthToken;
import com.project.user.dto.UserDTO;
import com.project.user.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

// 인증이 안 된 사용자들이 출입할 수 있는 경로 추가 //auth/**/
// "/"라는 곳
// static 밑 파일들

@Controller
@RequestMapping("/auth")
@Log4j2
@RequiredArgsConstructor
public class KakaoController {
	
	private final ExerciseService exerciseService;

	private final UserService userService;
	
	private final AuthenticationManager authenticationManager;
	
	private OAuthToken oauthToken;
	
	@GetMapping("/kakao/logout")
	public String kakaoLogout() {
	
		RestTemplate rt = new RestTemplate();
		
		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer "+oauthToken.getAccess_token());

		
		// Http Body 오브젝트 생성
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(null, headers);


		
		rt.exchange("https://kauth.kakao.com/v1/user/logout", HttpMethod.POST,
				kakaoTokenRequest, String.class);
		
		return "redirect:/logout";
	}

	@GetMapping("/kakao/callback")
	//@ResponseBody // Rest API형 컨트롤러가 됨
	public String kakaoCallback(String code) {

		// post로 key=value 타입을 forward 방식으로 request해야함
		// OkHttp
		// Retrofit2 -> 안드로이드에서 많이 씀
		// RestTemplate
		RestTemplate rt = new RestTemplate();

		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// Http Body 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "59cc93f38a07bc58003afcc13ee2a761");
		params.add("redirect_uri", "http://localhost:8888/auth/kakao/callback");
		params.add("code", code);
		params.add("client_secret ", "S391EswQIsLceXRThnJegdFKxW2vUW3O");

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);

		// Gson, Json Simple, ObjectMapper

		ObjectMapper objectMapper = new ObjectMapper();
		
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}	

		// oauth Token 받은 후 액세스 토큰 요청

		RestTemplate rt2 = new RestTemplate();

		// HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers2);

		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoProfileRequest, String.class);

		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		String password = kakaoProfile.getId().toString();

		UserDTO kakaoUser = UserDTO.builder()
				.user_id(kakaoProfile.getKakao_account().getEmail())
				.password(password)
				.name(kakaoProfile.getProperties().getNickname())
				.login_group("kakao")
				.sex(kakaoProfile.getKakao_account().getGender())
				.profile_image(kakaoProfile.getProperties().getProfile_image())
				.role("USER")
				.build();

		// 가입자, 비가입자 체크
		UserDTO originUser = userService.findUser(kakaoUser.getUser_id());
		// 없는 유저면
		if (originUser == null) {
			log.info("없는 유저입니다.");
			log.info("회원가입 처리 됩니다.");
			userService.userSignUp(kakaoUser);
		}

		
		
		// 로그인 처리 log.info("로그인 완료");
		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(kakaoUser.getUser_id(), password));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		
		return "redirect:/";
	}
}