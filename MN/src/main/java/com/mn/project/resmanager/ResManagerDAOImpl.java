package com.mn.project.resmanager;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ResManagerDAOImpl implements ResManagerDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace ="com.mn.project.mappers.resManagerMapper";

	@Override
	public List<ResManagerVO> list() throws Exception {
		
		return sqlSession.selectList(namespace+".list");
	}

	@Override
	public int mmupdate(ResManagerVO resManagerVO) throws Exception {
		return sqlSession.update(namespace+".mmupdate",resManagerVO);
	}

	@Override
	public List<ResManagerVO> view(String keyword) throws Exception {
		return sqlSession.selectList(namespace+".view",keyword);
	}

	@Override
	public int pReg(PartyManagerVO partyManagerVO) throws Exception {
		return sqlSession.insert(namespace+".pReg",partyManagerVO);
	}

	@Override
	public List<PartyManagerVO> pSearch() throws Exception {
		return sqlSession.selectList(namespace+".pSearch");
	}

	@Override
	public int pDel(String pDate) throws Exception {
		return sqlSession.delete(namespace+".pDel",pDate);
	}

	@Override
	public List<PartyReservationVO> puSearch(String pDate) throws Exception {
		return sqlSession.selectList(namespace+".puSearch",pDate);
				
	}

	@Override
	public int puUpd(PartyReservationVO vo) throws Exception {
		return sqlSession.update(namespace+".puUpd", vo);
	}







	

}
