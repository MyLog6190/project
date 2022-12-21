package com.project.user.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.project.naverlogin.cont.NaverLoginBO;
import com.project.user.dto.UserDTO;
import com.project.user.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/auth")
@RequiredArgsConstructor
public class LoginOutController {
	
	@Value("${profile.imgdir}")
	String fdir;
	
	private final UserService userService;
	
	//private final AuthenticationManager authenticationManager;
	
	private final NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@GetMapping("/login")
	public String loginPage(Model model, HttpSession session) {
	      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	      /* 인증요청문 확인 */
	      System.out.println("네이버:" + naverAuthUrl);
	      /* 객체 바인딩 */
	      model.addAttribute("urlNaver", naverAuthUrl);
		return "login";
	}
	
	   //네이버 로그인 성공시 callback호출 메소드
	   @RequestMapping(value = "/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
	   public String callbackNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
	         throws Exception {
		   log.info("네이버 로그인 세션 :"+naverLoginBO.getSession(session));
		   log.info("우리가 보낸 state값 :" +state);
		   log.info("두개가 같냐 ? " + naverLoginBO.getSession(session) == state);
		   

	      OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	        //로그인 사용자 정보를 읽어온다.
	       apiResult = naverLoginBO.getUserProfile(oauthToken);
	       
	      JSONParser jsonParser = new JSONParser();
	      JSONObject jsonObj;
	      
	      jsonObj = (JSONObject) jsonParser.parse(apiResult);
	      JSONObject response_obj = (JSONObject) jsonObj.get("response");         
	      // 프로필 조회
	      String email = (String) response_obj.get("email");
	      String name = (String) response_obj.get("name");
	      String gender=(String) response_obj.get("gender");
	      String profile_image = (String) response_obj.get("profile_image");
	      // 세션에 사용자 정보 등록
	      // session.setAttribute("islogin_r", "Y");
	      session.setAttribute("signIn", apiResult);
	      session.setAttribute("email", email);
	      session.setAttribute("name", name);
	      session.setAttribute("gender", gender);
	      session.setAttribute("profile_image", profile_image);
	      
	      System.out.println(email);
	      System.out.println(name);
	      System.out.println(gender);
	      System.out.println(profile_image);
	        /* 네이버 로그인 성공 페이지 View 호출 */
	      return "redirect:/naverloginsuccess";
	   }
	    
	   // 소셜 로그인 성공 페이지
	   @RequestMapping("/naverloginsuccess")
	   public String loginSuccess() {
		   return "naverloginsuccess";
	   }
	
	@GetMapping("/loginPage")
	public String loginForm() {
		return "loginForm";
	}
	
//	@PostMapping("/normal/login")
//	public String normalLogin(@RequestParam String user_id, @RequestParam String password) {
//		//로그인 처리
//		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(user_id, password));
//		SecurityContextHolder.getContext().setAuthentication(authentication);
//		return "redirect:/";
//	}

	@GetMapping("/logout")
	public String logout() {
		return "/";
	}
	
	@GetMapping("/register")
	public String registerForm() {
		return "registerForm";
	}
	
	@PostMapping("/register")
	public String registration(@ModelAttribute UserDTO userDTO, Model model, @RequestParam MultipartFile file) {
		if(userService.findUser(userDTO.getUser_id()) !=null) {
			String msg = "이미 등록된 유저입니다.";
			String red = "/auth/register";
			log.info("이미 등록된 유저입니다.");
			model.addAttribute("msg", msg);
			model.addAttribute("redirect", red);
			return "alert";
		}
		try {
			// 저장 파일 객체 생성
			File dest = new File(fdir+"/"+file.getOriginalFilename());
			// 파일 저장
			file.transferTo(dest);
			userDTO.setProfile_image("/views/images/profileimages/"+dest.getName());
			userService.userSignUp(userDTO);
		}catch(Exception e) {
			log.info("회원 등록 과정에서 문제 발생");
		}
		
		return "redirect:/";
	}
}
