package com.project.board.service;

import java.util.List;

import com.project.board.dto.BoardDTO;
import com.project.board.dto.PageRequestDTO;
import com.project.board.dto.PageResponseDTO;

public interface BoardService {
	List<BoardDTO> getAllPost();

	PageResponseDTO<BoardDTO> getList(PageRequestDTO pageRequestDTO);
	
	BoardDTO getOnePost(int b_no);
	
	void updatePost(BoardDTO boardDTO);
	
	void insertPost(BoardDTO boardDTO);
	
	void deletePost(int b_no);

	
}
