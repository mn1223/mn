package com.mn.project.friend;



import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mn.project.util.SessionClass;


@Controller
public class FriendController  {
	
	@Inject
	SessionClass session;
	
	@RequestMapping("/search")
	public String search(Model model) {
		
		model.addAttribute("id",session.getId("member"));
		System.out.println(session.getId("member"));
		
		return "friends/search";
	}
	
	
	
	
	
	
}
