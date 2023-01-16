package com.project.board.controller;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.board.dto.CommunityBoardDTO;
import com.project.board.service.CommunityService;
import com.project.common.config.auth.PrincipalDetail;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/community")
@RequiredArgsConstructor
@Log4j2
public class communityController {
	private final CommunityService communityService;
	
	@GetMapping
	public String getCommunityList(Model model) {
		List<CommunityBoardDTO> list = communityService.getCommunityList();
		model.addAttribute("Community",list);
		return "/community/list";
	}	
	
	@GetMapping("/writing")
	public String writing() {
		return "/community/writing";
	}
	
	@PostMapping("/writing")
	public String writing(@ModelAttribute CommunityBoardDTO board, Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		board.setUser_id(principal.getUsername());
		board.setCb_writer(principal.getName());
		
		communityService.communityPost(board);
		
		return "redirect:/community";
	}
	
	@GetMapping("/edit")
	public String editCommunity(int no, Model  model) {
		CommunityBoardDTO community = communityService.getDetail(no);
		model.addAttribute("community", community);
		return "/community/edit";
	}
	
	@PostMapping("/edit")
	public String editCommunity(@ModelAttribute CommunityBoardDTO board, Model model, @AuthenticationPrincipal PrincipalDetail principal) {
		log.info(board);
		communityService.editCommunity(board);
		return "redirect:/community";
	}
	
	@GetMapping("/read")
	public String getCommunityDetail(int no, Model  model) {
		CommunityBoardDTO community = communityService.getDetail(no);
		model.addAttribute("community", community);
		return "/community/detail";
	}
	
	@GetMapping("/delete")
	public String deleteCommunity(int no) {
		communityService.deleteCommunity(no);
		return "redirect:/community";
	}
}
