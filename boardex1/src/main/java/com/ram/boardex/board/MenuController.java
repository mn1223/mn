package com.ram.boardex.board;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/menu")
public class MenuController {
	
	@Inject
	MenuService service;
	
	@RequestMapping(value="/getMenu",method = {RequestMethod.GET,RequestMethod.POST})
	public String getMenuList(Model model) throws Exception{
		
		model.addAttribute("menuVO",new MenuVO());
		
		return "menu/menu";
	}
	
	

}
