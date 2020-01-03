package com.mn.project.register;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class RegisterController {

	@Inject
	private RegisterService service;

	//첫페이지에서 회원가입페이지로 이동하는페이지
	@RequestMapping(value="/signup", method = {RequestMethod.POST,RequestMethod.GET})
	public String signUp() throws Exception{

		return "/First/signup";
	}

	//가입하기버튼클릭시 회원가입성공페이지로 이동
	@RequestMapping(value="/signupcomplete", method = {RequestMethod.POST,RequestMethod.GET})
	public String signUpcomplete(@ModelAttribute("RegisterVO") RegisterVO registerVO) throws Exception{
		System.out.println(registerVO);
		service.insertUser(registerVO);
		return "/First/congratulation";
	}

	//회원가입성공페이지에서 메인페이지로 이동
	@RequestMapping(value="/commonhome", method = {RequestMethod.POST,RequestMethod.GET})
	public String signUpafter() throws Exception{

		return "First/commonhome";
	}

}
