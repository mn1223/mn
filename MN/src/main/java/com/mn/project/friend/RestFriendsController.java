package com.mn.project.friend;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mn.project.util.SessionClass;

@RestController
public class RestFriendsController {
	
	@Inject
	FriendService friendService;
	
	@Inject
	SessionClass session;
	
	@RequestMapping(value="/searchData1",method = RequestMethod.POST)
	public List<FriendVO> getSearchData(@RequestBody FriendVO vo){
		System.out.println(vo);		
		System.out.println(session.getId("member"));
		List<FriendVO> list = friendService.searchData(vo);
		
		System.out.println(list);
		
		return list;
	}
	
	@RequestMapping(value="/addFriend",method=RequestMethod.GET)
	public Map<String,Object> addFriendList(@RequestParam("yourid") String yourid) {
		Map<String,Object> result = new HashMap<>();
		FriendVO vo = new FriendVO();
		
		vo.setYourid(yourid);
		vo.setMyid(session.getId("member"));
		
		System.out.println(vo);
		
		try {
			friendService.addFriendList(vo);
			result.put("result","OK");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("result","FALSE");
		}
		
		return result;
	}
	@RequestMapping(value="/judgeFriend",method=RequestMethod.GET)
	public List<FriendVO> judgeFriend(@RequestParam("myid") String myid){
		List<FriendVO> list = null;
		FriendVO vo = new FriendVO();
		vo.setMyid(myid);
		
		list = friendService.judgeFirend(vo);
		System.out.println(list);
		
		return list;
		
	}
	
	
	
	

}
