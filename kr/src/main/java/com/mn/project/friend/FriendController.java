package com.mn.project.friend;



import java.io.File;

import java.io.FileReader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mn.project.util.SessionClass;

import chat.EchoHandler;
import chat.chatIdVO;


@Controller
public class FriendController  {
	EchoHandler eh = new EchoHandler(); 
	@Inject
	SessionClass session;
	
	@Inject
	FriendService friendService;
	
	@RequestMapping("/search")
	public String search(Model model,Principal principal) {
		
		model.addAttribute("id",principal.getName());
		
		
		return "friends/search";
	}
	
	@RequestMapping(value = "/chatList",method = RequestMethod.GET)
	public String chatList(Model model,Principal principal) {
		List<FriendVO> list = null;
		FriendVO vo = new FriendVO();
		
		vo.setMyid(principal.getName());
		
		list = friendService.getFriendTrue(vo);
		
		System.out.println(list);
		
		model.addAttribute("list", list);
				
		return "friends/chatList";
	}
	@RequestMapping(value="/friendmypage",method = RequestMethod.GET)
	public String friendMypage(Model model, Principal principal) {
		model.addAttribute("myid",principal.getName());
		
		
		return "friends/friendmypage";
	}
	
	@RequestMapping("/schoolsearch")
	public String schoolsearch(Model model) {
	
		return "friends/School";
	}
	
	@RequestMapping("/login/accessDenied")
	public String accessDenied(Model model) {
		System.out.println("오류!!!!!!!");
		return "login/accessDenied";
	}
	
	
	@RequestMapping(value="/chating",method = RequestMethod.GET)
	public String chating(Model model ,@RequestParam("myid")String myid,@RequestParam("yourid")String yourid) {			
		Path path = Paths.get("D:\\log\\" + myid+yourid+ ".txt");
		StringBuffer sb = new StringBuffer();
		Charset cs = StandardCharsets.UTF_8;
		
		List<String> list = new ArrayList<String>();
		
		try {
			list = Files.readAllLines(path,cs);
		}catch(Exception e) {
			e.printStackTrace();
		}
		for(String readLine : list) {
			sb.append(readLine+"<br>");
		}
		
		session.setId("myid",myid);
		session.setId("yourid",yourid);
		
		System.out.println("너와나의 연결고리 :"+myid+yourid);
		
		model.addAttribute("yourid",yourid);
	    model.addAttribute("myid",myid);
	    model.addAttribute("chatList",sb);
		    
		return "friends/chatroom";
	}

	
	
	
	
	
	
	
}
