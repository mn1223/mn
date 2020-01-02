package com.mn.project.friend;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestFriendsController {
	
	@Inject
	FriendService friendService;
	
	@RequestMapping(value="/searchData1",method = RequestMethod.POST)
	public List<FriendVO> getSearchData(@RequestBody FriendVO vo){
		System.out.println(vo);		
		List<FriendVO> list = friendService.searchData(vo);
		
		System.out.println(list);
		
		return list;
	}

}
