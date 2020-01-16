package com.mn.project.res;

import java.util.List;

import com.mn.project.resmanager.PartyManagerVO;

public interface ResService {
	//파티 조회
	public List<PartyManagerVO> pSearch() throws Exception;
	
	//파티 번호 가져오기
	public List<ResVO> getPno(ResVO vo) throws Exception;

	//파티 신청 하기
	public int insParty(ResVO vo) throws Exception;
	
	//이미 파티 신청한 회원인지 여부 확인
	public int check(ResVO vo) throws Exception;
		
}
