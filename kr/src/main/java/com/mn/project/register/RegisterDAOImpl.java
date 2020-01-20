package com.mn.project.register;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class RegisterDAOImpl implements RegisterDAO {
	
	@Inject
	private SqlSession sqlSession;

	private static String namespace="com.mn.project.mappers.Registor";
	
	@Override
	public void insertUser(RegisterVO registerVO) throws Exception {
		
		 sqlSession.insert(namespace+".insertUser",registerVO);
		 sqlSession.insert(namespace+".insertScinfo",registerVO);
	}
    
}
