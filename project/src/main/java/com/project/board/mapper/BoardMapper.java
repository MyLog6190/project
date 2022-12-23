package com.project.board.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.project.board.dto.BoardDTO;
import com.project.board.dto.PageRequestDTO;

@Repository
@MapperScan
public interface BoardMapper {
	
	List<BoardDTO> getAllPost();
	
	List<BoardDTO> getNotice();
	
	List<BoardDTO> selectList(PageRequestDTO pageRequestDTO);
	
	int getCount(PageRequestDTO pageRequestDTO);

	BoardDTO getOnePost(int b_no);
	
	void updatePost(BoardDTO boardDTO);
	
	void insertPost(BoardDTO boardDTO);
	
	void deletePost(int b_no);

	
}
