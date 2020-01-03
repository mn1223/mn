package com.mn.project.friend;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class FriendController  {
	
	@RequestMapping("/search")
	public String search() {
		
		
		
		return "friends/search";
	}
	
	
	
	
	
	
}
