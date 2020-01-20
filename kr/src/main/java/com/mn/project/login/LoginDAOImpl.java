package com.mn.project.login;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mn.project.friend.FriendVO;

@Repository
public class LoginDAOImpl implements LoginDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace="com.mn.project.mappers.Login";
	private static String namespace2="com.mn.project.mappers.matchmypage";
	
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

	@Override
	public LoginVO mmselect(LoginVO loginVO) throws Exception {
		
		return sqlSession.selectOne(namespace2+".mmselect", loginVO);
	}

	@Override
	public void update(LoginVO loginVO) throws Exception {
	
		sqlSession.update(namespace2+".mmdate",loginVO);
		
	}

	@Override
	public int duplicate(LoginVO loginVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace2+".idcheck",loginVO);
	}

	@Override
	public FriendVO getSchoolInfo(LoginVO loginVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.mn.project.mappers.friend.getSchoolInfo",loginVO);
	}

	@Override
	public List<LoginVO> getRInfo(String mmid) throws Exception {
		return sqlSession.selectList(namespace+".rInfo",mmid);
	}

	@Override
	public int delParty(int pno) throws Exception {
		return sqlSession.delete(namespace+".rDel",pno);
	}	
}
