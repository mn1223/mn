package com.mn.project.register;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class RegisterServiceImpl implements RegisterService{
  
	@Inject
	private RegisterDAO dao;
	
	@Override
	public void insertUser(RegisterVO registerVO) throws Exception {
		 dao.insertUser(registerVO);
	}
	
}
