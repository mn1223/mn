package com.ram.boardex.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {

	@Inject
	MenuDAO menuDAO;
	
	@Override
	public List<MenuVO> getMenuList() throws Exception {
		// TODO Auto-generated method stub
		return menuDAO.getMenuList();
	}

	@Override
	public int saveMenu(MenuVO menuVO) throws Exception {
		// TODO Auto-generated method stub
		return menuDAO.saveMenu(menuVO);
	}

	@Override
	public int updateMenu(MenuVO menuVO) throws Exception {
		// TODO Auto-generated method stub
		return menuDAO.updateMenu(menuVO);
	}

	@Override
	public int deleteMenu(String code) throws Exception {
		// TODO Auto-generated method stub
		return menuDAO.deleteMenu(code);
	}

}
