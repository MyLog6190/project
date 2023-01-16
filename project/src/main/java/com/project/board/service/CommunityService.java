package com.project.board.service;

import java.util.List;

import com.project.board.dto.CommunityBoardDTO;

public interface CommunityService {

	void communityPost(CommunityBoardDTO board);

	List<CommunityBoardDTO> getCommunityList();

	CommunityBoardDTO getDetail(int no);

	void deleteCommunity(int no);

	void editCommunity(CommunityBoardDTO board);

}
