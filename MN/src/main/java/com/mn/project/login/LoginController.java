package com.mn.project.login;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class LoginController {

	@Inject
	private LoginService service;
	
	 
	 HttpSession session;
	
	//로그인페이지로이동
	@RequestMapping(value="/login",method = {RequestMethod.POST,RequestMethod.GET})
    public String login(RedirectAttributes rttr) throws Exception{

		return "/login";
	}
	
	//로그인성공후 메인페이지로이동
	@RequestMapping(value="/successcommonhome", method = {RequestMethod.POST,RequestMethod.GET})
	public String success(@ModelAttribute("LoginVO") LoginVO loginVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
        
		session = req.getSession();
		
		LoginVO login = service.login(loginVO);
	
         if(login == null) {
        	  session.setAttribute("member", null); 
        	  rttr.addFlashAttribute("msg", false);
        	 return "redirect:/login";
         }else {
        	 System.out.println(loginVO);
        	  session.setAttribute("member", login.mmid); 
        	  System.out.println(session.getAttribute("member"));
        	 return "/commonhomecomplete"; 
         }
         
	}
	
	//로그인페이지에서 아이디찾기페이지로이동
	@RequestMapping(value="/idfind",method = {RequestMethod.POST,RequestMethod.GET})
    public String idfind() throws Exception{
		
		
		return "/idfind";
	}
	
	// 아이디찾기페이지에서 아이디찾은정보페이지로 이동,아이디찾은정보페이지
	@RequestMapping(value="/idfindafter",method = {RequestMethod.POST,RequestMethod.GET})
    public String idfindafter(@ModelAttribute("LoginVO") LoginVO loginVO, Model model) throws Exception{
		
		model.addAttribute("idfindaftern", service.idfind(loginVO));
		
		return "/idfindafter";
	}
	
	//로그인페이지에서 비번찾기페이지로이동
	@RequestMapping(value="/pwfind",method = {RequestMethod.POST,RequestMethod.GET})
    public String pwfind() throws Exception{
		
		return "/pwfind";
	}
	//비번바꾸는 페이지
	@RequestMapping(value="/pwchange",method = {RequestMethod.POST,RequestMethod.GET})
    public String pwfind(@ModelAttribute("LoginVO") LoginVO loginVO, HttpServletRequest req) throws Exception{
		
		
		LoginVO mmpwd = service.pwfind(loginVO);
		
	      if(mmpwd == null) {
        	  session.setAttribute("mmpwd", null); 
        	 return "redirect:/pwfind";
         }else {
        	  session.setAttribute("mmpwd", mmpwd);  
        	 return "/pwchange"; 
         }
	}
	//비번이 일치하면 다음페이지에서 비번변경되었음 페이지로 이동
	@RequestMapping(value="/changenotice", method = {RequestMethod.POST,RequestMethod.GET})
    public String pwchangecomplete(@ModelAttribute("LoginVO") LoginVO loginVO,HttpServletRequest req) throws Exception{
		
		
		service.pwchange(loginVO);
		
		return "/changenotice";
	}
	
    //로그인페이지에서 회원가입페이지로이동
	@RequestMapping(value="/signupgo", method = {RequestMethod.POST,RequestMethod.GET})
	public String signUp() throws Exception{

		return "/signup";
	}
	
    //마이페이지로이동
	@RequestMapping(value="/matchmypage", method = {RequestMethod.POST,RequestMethod.GET})
	public String gomypage() throws Exception{

		return "/matchmypage";
	}
	
    //마이페이지로이동
	@RequestMapping(value="/delete", method = {RequestMethod.POST,RequestMethod.GET})
	public String deletego(HttpServletRequest req) throws Exception{
	
		return "/delete";
	}
	
    //마이페이지에서 회원탈퇴누르시 탈퇴페이지로 이동
	@RequestMapping(value="/home", method = {RequestMethod.POST,RequestMethod.GET})
	public String delete(@ModelAttribute("LoginVO") LoginVO loginVO, HttpServletRequest req) throws Exception{
		
		String mmid =  (String) session.getAttribute("member");	
		loginVO.setMmid(mmid);
		
		LoginVO tt= service.mmdeletebe(loginVO);
		System.out.println(tt);

	      if(tt == null) {
        	  session.setAttribute("delete", null); 
        	 return "redirect:/delete";  
         }else {
        	  session.setAttribute("delete", tt);
        	  service.mmdelete(loginVO);
        	 return "/home"; 
         }
	}
}