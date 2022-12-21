package com.project.board.service;

import java.util.List;

import com.project.board.dto.BoardDTO;

public interface BoardService {
	List<BoardDTO> getAllPost();

	BoardDTO getOnePost(int b_no);
	
	void updatePost(BoardDTO boardDTO);
	
	void insertPost(BoardDTO boardDTO);
	
	void deletePost(int b_no);

}
