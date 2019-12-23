package com.ram.boardex.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDAOImpl implements MenuDAO {

	@Inject 
	private SqlSession session;
	
	static String namespace = "com.ram.boardex.mappers.menuMapper";
	
	@Override
	public List<MenuVO> getMenuList() throws Exception {
		
		return session.selectList(namespace+".getMenuList");
	}

	@Override
	public int saveMenu(MenuVO menuVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("?");
		return session.insert(namespace+".insertMenu", menuVO);
	}

	@Override
	public int updateMenu(MenuVO menuVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMenu(String code) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
