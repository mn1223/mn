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

	@Override
	public void addFriendList(FriendVO friendVO) {
		
		session.insert(namespace+".addFriendList",friendVO);
	}

	@Override
	public List<FriendVO> judgeFirend(FriendVO friendVO) {
		
		return session.selectList(namespace+".judgeFriend",friendVO);
	}

	@Override
	public List<FriendVO> getFriendFalse(FriendVO friendVO) {
		
		return session.selectList(namespace+".getFriendfalse",friendVO);
	}

	@Override
	public List<FriendVO> getFriendTrue(FriendVO friendVO) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getFriendtrue",friendVO);
	}

	@Override
	public void addFriendTrue(FriendVO friendVO) {
		session.update(namespace+".addFriendtrue",friendVO);	
	}

	@Override
	public void addFriendListTrue(FriendVO friendVO) {
		session.insert(namespace+".addFriendListTrue",friendVO);
		
	}

	@Override
	public List<FriendVO> getMyFriendFalse(FriendVO friendVO) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getMyFriendfalse",friendVO);
	}

	@Override
	public void deleteFriendListFalse(FriendVO friendVO) {
		// TODO Auto-generated method stub
		session.delete(namespace+".deleteFriendFalse",friendVO);
	}

	@Override
	public void deleteFriendStatus(FriendVO friendVO) {
		// TODO Auto-generated method stub
		session.update(namespace+".deleteFriendStatus", friendVO);
		
	}

	@Override
	public void deleteFriendListTrue(FriendVO friendVO) {
		session.delete(namespace+".deleteFriendTrue",friendVO);
		
	}

	@Override
	public void schoolUpd(FriendVO friendVO) {
		String type = friendVO.getSearchType();
		
		switch(type) {
		case "es":
			System.out.println("초등학교 입력"+type);
			session.selectList(namespace+".eschoolUpd",friendVO);	
			break;
		case "ms" :
			System.out.println("중학교 입력"+type);
			session.selectList(namespace+".mschoolUpd",friendVO);
			break;
		case "hs" :
			System.out.println("고등학교 입력"+type);
			session.selectList(namespace+".hschoolUpd",friendVO);
			break;
	    default :
			System.out.println("대학교 입력"+type);
			session.selectList(namespace+".uschoolUpd",friendVO);
			break;

		}
	}
	

}
