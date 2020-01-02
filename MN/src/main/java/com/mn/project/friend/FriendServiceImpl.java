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

}
