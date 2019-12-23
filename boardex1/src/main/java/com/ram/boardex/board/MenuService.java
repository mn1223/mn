package com.ram.boardex.board;

import java.util.List;

public interface MenuService {
	public List<MenuVO> getMenuList() throws Exception;
	
	public int saveMenu(MenuVO menuVO) throws Exception;
	
	public int updateMenu(MenuVO menuVO) throws Exception;
	
	public int deleteMenu(String code) throws Exception;

}
