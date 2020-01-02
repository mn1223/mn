package com.mn.project.login;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAOImpl implements LoginDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace="com.mn.project.mappers.Login";
	
	@Override
	public LoginVO login(LoginVO loginVO) throws Exception {
		
	  return sqlSession.selectOne(namespace+".login", loginVO);
	}
	
	@Override
	public LoginVO idfind(LoginVO loginVO) throws Exception {
		
	  return sqlSession.selectOne(namespace+".idfind", loginVO);
	}
	
	@Override
	public LoginVO pwfind(LoginVO loginVO) throws Exception {
		
	  return sqlSession.selectOne(namespace+".pwfind", loginVO);
	}
	
	@Override
	public int pwchange(LoginVO loginVO) throws Exception {
		
	  return sqlSession.update(namespace+".pwfindchange", loginVO);
	}

	@Override
	public LoginVO mmdeletebe(LoginVO loginVO) throws Exception {
		
		return sqlSession.selectOne(namespace+".deletebefore", loginVO);
	}
	
	@Override
	public int mmdelete(LoginVO loginVO) throws Exception {
		
		return sqlSession.update(namespace+".mmdelete", loginVO);
	}	
}
