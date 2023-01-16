package com.project.board.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.board.dto.CommunityBoardDTO;
import com.project.board.mapper.CommunityMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Transactional
@Log4j2
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService {
	
	private final CommunityMapper communityMapper;
	
	@Override
	public void communityPost(CommunityBoardDTO board) {
		try {
			communityMapper.insertCommunity(board);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Override
	public List<CommunityBoardDTO> getCommunityList() {
		List<CommunityBoardDTO> list = null;
		
		try {
			list = communityMapper.selectAllCommunity();
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		return list;
	}

	@Override
	public CommunityBoardDTO getDetail(int no) {
		CommunityBoardDTO community = null;
		
		try {
			community = communityMapper.selectCommunity(no);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		return community;
	}

	@Override
	public void deleteCommunity(int no) {
		
		try {
			communityMapper.deleteCommunity(no);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
	}

	@Override
	public void editCommunity(CommunityBoardDTO board) {
		try {
			communityMapper.updateCommunity(board);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

}
