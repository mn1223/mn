package com.mn.project.friend;

import java.util.List;

public interface FriendDAO {
	public List<FriendVO> searchData(FriendVO friendVO);
	
	public void addFriendList(FriendVO friendVO);
	
	public List<FriendVO> judgeFirend(FriendVO friendVO);
	
	
}
