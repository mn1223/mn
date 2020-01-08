package com.mn.project.friend;



import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mn.project.util.SessionClass;


@Controller
public class FriendController  {
	
	@Inject
	SessionClass session;
	
	@Inject
	FriendService friendService;
	
	@RequestMapping("/search")
	public String search(Model model) {
		
		model.addAttribute("id",session.getId("member"));
		System.out.println(session.getId("member"));
		
		return "friends/search";
	}
	
	@RequestMapping(value = "/chatList",method = RequestMethod.GET)
	public String chatList(Model model) {
		List<FriendVO> list = null;
		FriendVO vo = new FriendVO();
		
		vo.setMyid(session.getId("member"));
		
		list = friendService.getFriendTrue(vo);
		
		System.out.println(list);
		
		model.addAttribute("list", list);
				
		return "friends/chatList";
	}
	@RequestMapping(value="/friendmypage",method = RequestMethod.GET)
	public String friendMypage(Model model) {
		model.addAttribute("myid",session.getId("member"));
		
		
		return "friends/friendmypage";
	}
	
	
	
	
	
	
}
