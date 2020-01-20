package com.mn.project.resmanager;

import java.util.List;


public interface ResManagerDAO {
	//회원목록
	public List<ResManagerVO> list() throws Exception;
	
	//회원정보조회
	public List<ResManagerVO> view(String keyword) throws Exception;
		
	//회원정보수정
	public int mmupdate(ResManagerVO resManagerVO) throws Exception;
	
	//파티 추가
	public int pReg(PartyManagerVO partyManagerVO) throws Exception;
	
	//파티 조회
	public List<PartyManagerVO> pSearch() throws Exception;
	
	//파티 삭제
	public int pDel(String pDate) throws Exception;
	
	//파티별 신청 회원 목록 정보 조회
	public List<PartyReservationVO> puSearch(String pDate) throws Exception;
	
	//파티 회원 정보 수정
	public int puUpd(PartyReservationVO vo);
	 
	
}
