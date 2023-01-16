package com.project.board.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.project.board.dto.CommunityBoardDTO;

@Repository
@MapperScan
public interface CommunityMapper {

	List<CommunityBoardDTO> selectAllCommunity();
	
	void insertCommunity(CommunityBoardDTO board);

	CommunityBoardDTO selectCommunity(int no);

	void deleteCommunity(int no);

	void updateCommunity(CommunityBoardDTO board);

}
