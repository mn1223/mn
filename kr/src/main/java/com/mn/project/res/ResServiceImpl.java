package com.mn.project.res;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mn.project.resmanager.PartyManagerVO;

@Service
public class ResServiceImpl implements ResService{

	@Inject
	private ResDAO dao;
		
	@Override
	public List<PartyManagerVO> pSearch() throws Exception {
		return dao.pSearch();
	}

	@Override
	public List<ResVO> getPno(ResVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.getPno(vo);
	}

	@Override
	public int insParty(ResVO vo) throws Exception {
		return dao.insParty(vo);
	}

	@Override
	public int check(ResVO vo) throws Exception {
		return dao.check(vo);
	}

}
