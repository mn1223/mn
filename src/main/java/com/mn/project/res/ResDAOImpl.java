package com.mn.project.res;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mn.project.resmanager.PartyManagerVO;

@Repository
public class ResDAOImpl implements ResDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace ="com.mn.project.mappers.resMapper";

	@Override
	public List<PartyManagerVO> pSearch() throws Exception {
		return sql.selectList(namespace+".pSearch");
	}

	@Override
	public List<ResVO> getPno(ResVO vo) {
		return sql.selectList(namespace+".getPno",vo);
	}

	@Override
	public int insParty(ResVO vo) throws Exception {
		return sql.insert(namespace+".insP",vo);
	}

	@Override
	public int check(ResVO vo) throws Exception {
		return sql.selectOne(namespace+".check",vo);
	}
	
}
