package com.mn.project.resmanager;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ResManagerServiceImpl implements ResManagerService{
	@Inject
	private ResManagerDAO dao;

	@Override
	public List<ResManagerVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public int mmupdate(ResManagerVO resManagerVO) throws Exception {
		return dao.mmupdate(resManagerVO);
	}

	@Override
	public List<ResManagerVO> view(String keyword) throws Exception {
		return dao.view(keyword);
	}

	@Override
	public int pReg(PartyManagerVO partyManagerVO) throws Exception {
		return dao.pReg(partyManagerVO);
	}

	@Override
	public List<PartyManagerVO> pSearch() throws Exception {
		return dao.pSearch();
	}

	@Override
	public int pDel(String pDate) throws Exception {
		return dao.pDel(pDate);
	}

	@Override
	public List<PartyReservationVO> puSearch(String pDate) throws Exception {
		return dao.puSearch(pDate);
	}

	@Override
	public int puUpd(PartyReservationVO vo) throws Exception {
		return dao.puUpd(vo);
	}

	
	
}
