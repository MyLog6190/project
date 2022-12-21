package com.project.board.controller;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.board.dto.BoardDTO;
import com.project.board.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
@Log4j2
public class BoardController {
		
	private final BoardService boardService;
	
	@GetMapping("")
	public String mainPage(Model model) {
		List<BoardDTO> bList = null;
		
		try {
			bList = boardService.getAllPost();
			log.info(bList);
			model.addAttribute("list", bList);
		} catch(Exception e) {
			
		}
		return "/board/main";
	}
	
	@GetMapping("/list")
	public String getAllPost(Model model) {
		List<BoardDTO> bList = null;
		log.info(boardService.getAllPost());
		try {
			bList = boardService.getAllPost();
			log.info(bList);
			model.addAttribute("list", bList);
		}catch (Exception e) {
			log.error("게시글 불러오는 도중 에러 발생");
		}
		return "/board/list";
	}
	
	@GetMapping("/{b_no}")
	public String getOnePost(@PathVariable("b_no") int b_no, Model model){
		BoardDTO boardDTO = null;
		try {
			boardDTO = boardService.getOnePost(b_no);
			model.addAttribute("detail", boardDTO);
		} catch(Exception e) {
			log.error("게시글 불러오는 도중 에러 발생");
		}
		return "/board/detail";
	}
	
	@GetMapping("/update/{b_no}")
	public String updatePage(@PathVariable("b_no") int b_no, Model model) {
		BoardDTO boardDTO = null;
		try {
			boardDTO = boardService.getOnePost(b_no);
			model.addAttribute("detail", boardDTO);
		} catch(Exception e) {
			log.error("게시글 불러오는 도중 에러 발생");
		}
		return "/board/updateForm";
	}
	
	@PostMapping("/update/{b_no}")
	public String updatePost(@PathVariable int b_no, @ModelAttribute("detail") BoardDTO boardDTO,
				Model model) {
		log.info(boardDTO);
		try{
			boardService.updatePost(boardDTO);
			String msg = "글 수정 완료";
			String red = "/board/"+b_no;
			log.info("글 수정 완료");
			model.addAttribute("msg", msg);
			model.addAttribute("redirect", red);
			return "/alert";
		} catch(Exception e) {
			log.error("게시글 수정 중 문제 발생");
		}
		
		return "redirect:/board/" + b_no;
	}

	@GetMapping("/post")
	public String insertPage() {
		
		return "/board/insertForm";
	}

	@PostMapping("/insert")
	public String insertPost(Model model, @ModelAttribute BoardDTO boardDTO) {
		try {
			boardService.insertPost(boardDTO);
			String msg = "글이 정상적으로 등록되었습니다.";
			String red = "/board/list";
			model.addAttribute("msg", msg);
			model.addAttribute("redirect", red);
			return "alert";
		} catch(Exception e) {
			log.error("게시글 등록 중 문제 발생");
		}
		return "redirect:/board/list";
	}
	
	@GetMapping("/delete/{b_no}")
	public String deletePost(Model model, @PathVariable int b_no) {
		try {
		boardService.deletePost(b_no);
		String msg = "글이 정상적으로 삭제되었습니다.";
		String red = "/board/list";
		model.addAttribute("msg", msg);
		model.addAttribute("redirect", red);
		return "alert";
		} catch(Exception e) {
			log.error("게시글 삭제 중 문제 발생");
		}
		return "redirect:/board/list";
	}
	
	
}
