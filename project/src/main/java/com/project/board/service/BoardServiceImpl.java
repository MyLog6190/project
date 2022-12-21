package com.project.board.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.board.dto.BoardDTO;
import com.project.board.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Transactional
@Log4j2
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private final BoardMapper boardMapper;

	@Override
	public BoardDTO getOnePost(int b_no) {
		return boardMapper.getOnePost(b_no);
	}

	@Override
	public List<BoardDTO> getAllPost() {
		List<BoardDTO> list = boardMapper.getAllPost();
		return list;
	}

	@Override
	public void updatePost(BoardDTO boardDTO) {
		boardMapper.updatePost(boardDTO);
	}

	@Override
	public void insertPost(BoardDTO boardDTO) {
		boardMapper.insertPost(boardDTO);
	}

	@Override
	public void deletePost(int b_no) {
		boardMapper.deletePost(b_no);
	}


	
	
}
