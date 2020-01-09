package com.mn.project.login;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;


import javax.servlet.http.HttpServletRequest;

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

	@Inject
	private LoginService service;
	
	@Inject
	private SessionClass session;
	 
	//로그인페이지로이동
	@RequestMapping(value="/login",method = {RequestMethod.POST,RequestMethod.GET})
    public String login(RedirectAttributes rttr) throws Exception{
		
		return "/First/login";
	}
	
	//로그인성공후 메인페이지로이동
	@RequestMapping(value="/successcommonhome", method = {RequestMethod.POST,RequestMethod.GET})
	public String success(@ModelAttribute("LoginVO") LoginVO loginVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
        
		session.getSessionId(req);
		
		LoginVO login = service.login(loginVO);
	
         if(login == null) {
        	  session.setId("member",null);    
        	  rttr.addFlashAttribute("msg", false);
        	 return "redirect:/login";
        	 
         }else {
        	  System.out.println(loginVO);
        	  session.setId("member",login.mmid);
        	  System.out.println(session.getId("member"));
        	 return "/First/commonhomecomplete"; 
         }
         
	}
	
	//로그인페이지에서 아이디찾기페이지로이동
	@RequestMapping(value="/idfind",method = {RequestMethod.POST,RequestMethod.GET})
    public String idfind() throws Exception{
		
		
		return "/First/idfind";
	}
	
	// 아이디찾기페이지에서 아이디찾은정보페이지로 이동,아이디찾은정보페이지
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
		
	      if(mmpwd == null) {
        	  session.setId("mmpwd", null); 
        	 return "redirect:/pwfind";
         }else {
        	  session.setId("mmpwd", mmpwd.mmpwd); 
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
	public String gomypage(Model model) throws Exception{
		LoginVO loginVO = new LoginVO();
		loginVO.setMmid(session.getId("member"));
		
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
	public String delete(@ModelAttribute("LoginVO") LoginVO loginVO) throws Exception{
		
		String mmid =  session.getId("member");	
				
		loginVO.setMmid(mmid);//로그인한 아이디의 정보를 loginVO에다 넣는다.
		
		LoginVO tt= service.mmdeletebe(loginVO);
		System.out.println(tt);

	      if(tt == null) {
        	  session.setId("delete", null); 
        	 return "redirect:/delete";  
         }else {
        	  session.setId("delete", tt.mmid);
        	  service.mmdelete(loginVO);
        	 return "/First/home"; 
         }
	}
	@ResponseBody
	@RequestMapping(value="/uu", method = {RequestMethod.POST,RequestMethod.GET})
	public String tryoo(@RequestParam("ididid") String mmid,@RequestParam("pwd") String pwd) throws Exception{
		
		LoginVO tt= new LoginVO();
		tt.setMmid(mmid);
		tt.setMmpwd(pwd);
		
		tt= service.login(tt);
		tt.getMmgrade();
		System.out.println(tt);
		return tt.getMmgrade();
	}
}