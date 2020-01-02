package com.mn.project.login;

import javax.inject.Inject;

public interface LoginDAO {
	
	public LoginVO login(LoginVO loginVO) throws Exception;
	
	public LoginVO idfind(LoginVO loginVO) throws Exception;
	
	public LoginVO pwfind(LoginVO loginVO) throws Exception;
	
	public int pwchange(LoginVO loginVO) throws Exception;
	
	public LoginVO mmdeletebe(LoginVO loginVO) throws Exception;
	
	public int mmdelete(LoginVO loginVO) throws Exception;
}
