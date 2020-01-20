package com.mn.project.login;

import java.util.List;

import javax.inject.Inject;

import com.mn.project.friend.FriendVO;

public interface LoginDAO {
	
	public LoginVO login(LoginVO loginVO) throws Exception;
	
	public LoginVO idfind(LoginVO loginVO) throws Exception;
	
	public LoginVO pwfind(LoginVO loginVO) throws Exception;
	
	public int pwchange(LoginVO loginVO) throws Exception;
	
	public LoginVO mmdeletebe(LoginVO loginVO) throws Exception;
	
	public int mmdelete(LoginVO loginVO) throws Exception;
	
	//마이페이지 아이디 해당정보 
	public LoginVO mmselect(LoginVO loginVO) throws Exception;
	
	//회원정보 업데이트
	public void update(LoginVO loginVO) throws Exception;
	
	//중복확인
	public int duplicate(LoginVO loginVO) throws Exception;
	
	//학교정보 가져오기
	public FriendVO getSchoolInfo(LoginVO loginVO) throws Exception;
	
	//실시간 예약 현황 가져오기
	public List<LoginVO> getRInfo(String mmid) throws Exception; 
	
	//예약 현황 취소(삭제)
	public int delParty(int pno) throws Exception;
	
}