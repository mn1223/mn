package com.mn.project.friend;

import java.util.List;

public interface FriendDAO {
	public List<FriendVO> searchData(FriendVO friendVO);
	
	public void addFriendList(FriendVO friendVO);
	
	public List<FriendVO> judgeFirend(FriendVO friendVO);
	
	public List<FriendVO> getFriendFalse(FriendVO friendVO);
	
	public List<FriendVO> getFriendTrue(FriendVO friendVO);
	
	public void addFriendTrue(FriendVO friendVO);
	
	public void addFriendListTrue(FriendVO friendVO);
	
	public List<FriendVO> getMyFriendFalse(FriendVO friendVO);
	
	public void deleteFriendListFalse(FriendVO friendVO);
	
	public void deleteFriendStatus(FriendVO friendVO);
	
	public void deleteFriendListTrue(FriendVO friendVO);
	
	public void schoolUpd(FriendVO friendVO);
	
	public FriendVO getMyName(FriendVO friendVO);
	
	
	
}
