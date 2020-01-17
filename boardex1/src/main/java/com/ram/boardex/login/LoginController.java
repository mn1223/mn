package com.ram.boardex.login;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	UserVO vo = new UserVO();
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginForm(Model model) throws Exception{
		model.addAttribute("userVO", vo);
		return "login/login";
	}
	
	
	

}
