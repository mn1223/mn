package com.mn.project.login;

import java.security.Principal;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mn.project.util.SessionClass;



@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	
	@Inject
	private LoginService service;
	
	@Inject
	private SessionClass session;
	
	@RequestMapping(value = "/login/loginForm", method = RequestMethod.GET)
	public String loginFor(Locale locale, Model model,HttpServletRequest req) {
		logger.info("Welcome Login Form!");
		session.getSessionId(req);
		
		return "view/third";
	}
	
	//로그인페이지로이동
	@RequestMapping(value="/login",method = {RequestMethod.POST,RequestMethod.GET})
    public String login(RedirectAttributes rttr) throws Exception{
		
		return "/First/login";
	}
	
		@RequestMapping(value="/mmmain",method = {RequestMethod.POST,RequestMethod.GET})
	    public String mmmain(RedirectAttributes rttr,Principal principal,Model model) throws Exception{
			try{
				if(principal.getName().equals("admin@naver.com")) {		
				model.addAttribute("admin",principal.getName()); 
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		
			return "/view/mm_main";
		}
		
		@RequestMapping(value="/nfmain",method = {RequestMethod.POST,RequestMethod.GET})
	    public String nfmain(RedirectAttributes rttr,Principal principal,Model model) throws Exception{
			try{
				if(principal.getName().equals("admin@naver.com")) {		
				model.addAttribute("admin",principal.getName()); 
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		
			return "/friends/nfmain";
		}
	/*
	//로그인성공후 메인페이지로이동
	@RequestMapping(value="/successcommonhome", method = {RequestMethod.POST,RequestMethod.GET})
	public String success(@ModelAttribute("LoginVO") LoginVO loginVO, HttpServletRequest req, RedirectAttributes rttr,Principal principal) throws Exception{
        
		
		session.getSessionId(req);
		System.out.println(principal.getName());
		
		
		
		
		
		LoginVO login = service.login(loginVO);
	
         if(login == null) {
        	  session.setId("member",null);    
        	 return "redirect:/login";
        	 
         }else {
        	  System.out.println(loginVO);
        	  session.setId("member",login.mmid);
        	  System.out.println(session.getId("member"));
        	 return "/First/commonhomecomplete"; 
         }
		
		return "home";
         
	}*/
		
	
	//로그인페이지에서 아이디찾기페이지로이동
	@RequestMapping(value="/idfind",method = {RequestMethod.POST,RequestMethod.GET})
    public String idfind() throws Exception{
		
		return "/First/idfind";
	}
	
	//아이디찾기페이지에서 아이디찾은정보페이지로 이동,아이디찾은정보페이지
	@RequestMapping(value="/idfindafter",method = {RequestMethod.POST,RequestMethod.GET})
    public String idfindafter(@ModelAttribute("LoginVO") LoginVO loginVO, Model model) throws Exception{
		
		model.addAttribute("idfindaftern", service.idfind(loginVO));
		
		return "/First/idfindafter";
	}
	
	//로그인페이지에서 비번찾기페이지로이동
	@RequestMapping(value="/pwfind",method = {RequestMethod.POST,RequestMethod.GET})
    public String pwfind() throws Exception{
		
		return "/First/pwfind";
	}
	
	//비번바꾸는 페이지
	@RequestMapping(value="/pwchange",method = {RequestMethod.POST,RequestMethod.GET})
    public String pwfind(@ModelAttribute("LoginVO") LoginVO loginVO) throws Exception{
		
		LoginVO mmpwd = service.pwfind(loginVO);
		System.out.println(mmpwd);
	      if(mmpwd == null) {
        	 
        	 return "redirect:/pwfind";
         }else {
        	   
        	 return "/First/pwchange";   
         }	      
	}
	
	//비번이 일치하면 다음페이지에서 비번변경되었음 페이지로 이동
	@RequestMapping(value="/changenotice", method = {RequestMethod.POST,RequestMethod.GET})
    public String pwchangecomplete(@ModelAttribute("LoginVO") LoginVO loginVO,HttpServletRequest req) throws Exception{
		
		service.pwchange(loginVO);
		
		return "/First/changenotice";
	}
	
    //로그인페이지에서 회원가입페이지로이동
	@RequestMapping(value="/signupgo", method = {RequestMethod.POST,RequestMethod.GET})
	public String signUp() throws Exception{

		return "/First/signup";
	}
	
    //마이페이지로이동
	@RequestMapping(value="/matchmypage", method = {RequestMethod.POST,RequestMethod.GET})
	public String gomypage(Model model,Principal principal) throws Exception{
		LoginVO loginVO = new LoginVO();
		loginVO.setMmid(principal.getName());
		System.out.println(principal.getName());
		LoginVO tt = service.select(loginVO);
		
		model.addAttribute("userInfo",tt);

		return "/First/matchmypage";
	}
	
    //삭제페이지로이동
	@RequestMapping(value="/delete", method = {RequestMethod.POST,RequestMethod.GET})
	public String deletego(HttpServletRequest req) throws Exception{
	
		return "/First/delete";
	}
	
    //마이페이지에서 회원탈퇴누르시 탈퇴페이지로 이동
	@RequestMapping(value="/home", method = {RequestMethod.POST,RequestMethod.GET})
	public String delete(@ModelAttribute("LoginVO") LoginVO loginVO,Principal principal) throws Exception{
		
		String mmid =  principal.getName();	
				
		loginVO.setMmid(mmid);//로그인한 아이디의 정보를 loginVO에다 넣는다.
		
		LoginVO tt= service.mmdeletebe(loginVO);
		System.out.println(tt);

	      if(tt == null) {
        	  
        	 return "redirect:/delete";  
         }else {
        	  
        	  service.mmdelete(loginVO);
        	 return "redirect:/"; 
         }
	}	
}