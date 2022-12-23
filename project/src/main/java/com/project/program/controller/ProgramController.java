package com.project.program.controller;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.common.config.auth.PrincipalDetail;
import com.project.program.dto.ProgramDTO;
import com.project.program.service.ProgramService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/exprog")
@RequiredArgsConstructor
public class ProgramController {
	private final ProgramService programService;

	public String getLibraries(@AuthenticationPrincipal PrincipalDetail principal, Model model) {
		List<ProgramDTO> list = null;
		String user_id = principal.getUsername();
		try {
			list = programService.getAllProgram();
			model.addAttribute("plist", list);
		} catch(Exception e) {
			log.error(e.getMessage());
			log.warn("프로그램 로드 과정에서 문제 발생");
		}
		return "/program-detail";
	}

}
