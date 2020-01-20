package com.mn.project.login;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mn.project.friend.FriendVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	private LoginDAO dao;
	
	@Override
	public LoginVO login(LoginVO loginVO) throws Exception {
		
		return dao.login(loginVO);	
	}
	
	@Override
	public LoginVO idfind(LoginVO loginVO) throws Exception {
		
		return dao.idfind(loginVO);
	}
	
	@Override
	public LoginVO pwfind(LoginVO loginVO) throws Exception {
		
		return dao.pwfind(loginVO);
	}

	@Override
	public int pwchange(LoginVO loginVO) throws Exception {

		return dao.pwchange(loginVO);
	}

	@Override
	public LoginVO mmdeletebe(LoginVO loginVO) throws Exception {
		
		return dao.mmdeletebe(loginVO);
	}

	@Override
	public int mmdelete(LoginVO loginVO) throws Exception {
		
		return dao.mmdelete(loginVO);
	}

	@Override
	public LoginVO select(LoginVO loginVO) throws Exception {
		
		return dao.mmselect(loginVO);
	}

	@Override
	public void update(LoginVO loginVO) throws Exception {
	 
		dao.update(loginVO);
	}

	@Override
	public int duplicate(LoginVO loginVO) throws Exception {
		return dao.duplicate(loginVO);
	}

	@Override
	public FriendVO getSchoolInfo(LoginVO loginVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.getSchoolInfo(loginVO);
	}

	@Override
	public List<LoginVO> getRInfo(String mmid) throws Exception {
		return dao.getRInfo(mmid);
	}

	@Override
	public int delParty(int pno) throws Exception {
		return dao.delParty(pno);
	}
}
