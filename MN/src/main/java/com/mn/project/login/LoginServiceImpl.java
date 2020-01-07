package com.mn.project.login;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
}
