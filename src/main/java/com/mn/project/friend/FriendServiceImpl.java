package com.mn.project.friend;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
@Service
public class FriendServiceImpl implements FriendService {

	@Inject
	FriendDAO friendDAO;
	
	@Override
	public List<FriendVO> searchData(FriendVO friendVO) {
			
		return friendDAO.searchData(friendVO);
	}

	@Override
	public void addFriendList(FriendVO friendVO) {
		
		friendDAO.addFriendList(friendVO);
		
	}

	@Override
	public List<FriendVO> judgeFirend(FriendVO friendVO) {
		
		return friendDAO.judgeFirend(friendVO);
	}

	@Override
	public List<FriendVO> getFriendFalse(FriendVO friendVO) {
		// TODO Auto-generated method stub
		return friendDAO.getFriendFalse(friendVO);
	}

	@Override
	public List<FriendVO> getFriendTrue(FriendVO friendVO) {
		// TODO Auto-generated method stub
		return friendDAO.getFriendTrue(friendVO);
	}

	@Override
	public void addFriendTrue(FriendVO friendVO) {
		
		friendDAO.addFriendTrue(friendVO);
	}

	@Override
	public void addFriendListTrue(FriendVO friendVO) {
		friendDAO.addFriendListTrue(friendVO);
		
	}

	@Override
	public List<FriendVO> getMyFriendFalse(FriendVO friendVO) {
		// TODO Auto-generated method stub
		return friendDAO.getMyFriendFalse(friendVO);
	}

	@Override
	public void deleteFriendListFalse(FriendVO friendVO) {
		// TODO Auto-generated method stub
		friendDAO.deleteFriendListFalse(friendVO);	
	}

	@Override
	public void deleteFriendStatus(FriendVO friendVO) {
		friendDAO.deleteFriendStatus(friendVO);
		
	}

	@Override
	public void deleteFriendListTrue(FriendVO friendVO) {
		friendDAO.deleteFriendListTrue(friendVO);
		
	}

}
