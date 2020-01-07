package com.mn.project.friend;

import java.util.ArrayList;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FriendDAOImpl implements FriendDAO {

	@Inject
	SqlSession session;
	
	static String namespace = "com.mn.project.mappers.friend";
	
	@Override
	public List<FriendVO> searchData(FriendVO friendVO) {
		
		String type = friendVO.getSearchType();
		
		switch(type) {
		case "es":
			return session.selectList(namespace+".getSearchList",friendVO);	
		case "ms" :
			return session.selectList(namespace+".getSearchListm",friendVO);
		case "hs" :
			return session.selectList(namespace+".getSearchListh",friendVO);
	    default :
			return session.selectList(namespace+".getSearchListu",friendVO);

		}
		
		
	}

}
