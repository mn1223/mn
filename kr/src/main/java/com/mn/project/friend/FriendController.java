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

import com.mn.project.login.LoginService;
import com.mn.project.login.LoginVO;
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
	
	@Inject
	LoginService loginService;
	
	@RequestMapping("/search")
	public String search(Model model,Principal principal) {
		model.addAttribute("myid",principal.getName());
		model.addAttribute("id",principal.getName());
		
		
		return "friends/search";
	}
	
	@RequestMapping(value = "/chatList",method = RequestMethod.GET)
	public String chatList(Model model,Principal principal) {

		model.addAttribute("myid", principal.getName());
				
		return "friends/chatList";
	}
	@RequestMapping(value="/friendmypage",method = RequestMethod.GET)
	public String friendMypage(Model model, Principal principal) throws Exception {
		model.addAttribute("myid",principal.getName());
		LoginVO loginVO = new LoginVO();
		loginVO.setMmid(principal.getName());
		
		LoginVO tt = loginService.select(loginVO);
		FriendVO friendVO = loginService.getSchoolInfo(loginVO);
		
		model.addAttribute("userInfo",tt);
		model.addAttribute("scinfo",friendVO);
		
		
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
	public String chating(Model model ,@RequestParam("myid")String myid,@RequestParam("yourid")String yourid,@RequestParam("mmname")String name) {			
		Path path = Paths.get("D:\\log\\" + myid+yourid+ ".txt");
		StringBuffer sb = new StringBuffer();
		Charset cs = StandardCharsets.UTF_8;
		FriendVO friendVO = new FriendVO();
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
			
		int yournum;
		int mynum;
		String reyourid;
		String remyid;
		
		yournum = yourid.indexOf("@");
		mynum = myid.indexOf("@");
		System.out.println(yournum);
		System.out.println(mynum);
		if(yournum == -1) {
			reyourid = yourid;
		}else {			
			reyourid = yourid.substring(0,yourid.indexOf("@"));
		}
		
		if(mynum==-1) {
			remyid = myid;

		}else {			
			remyid = myid.substring(0,myid.indexOf("@"));
		}		
		friendVO.setScmmid(myid);
		friendVO = friendService.getMyName(friendVO);
		
		System.out.println(name);
		System.out.println(friendVO.getMmname());
		model.addAttribute("yourname",name);
		model.addAttribute("myname",friendVO.getMmname());
		model.addAttribute("yourid",reyourid);
	    model.addAttribute("myid",remyid);
	    model.addAttribute("chatList",sb);
		    
		return "friends/chatroom";
	}	
}
