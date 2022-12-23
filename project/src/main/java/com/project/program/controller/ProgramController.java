package com.project.program.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.program.service.ProgramService;

public class ProgramController {
	private final ProgramService programService;

	@Value("${program.imgdir}")

	String pimgdir;

	@GetMapping

	public String getLibraries(AuthenticationPrincipal PrincipalDetail principal, Model model) {
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
