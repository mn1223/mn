package com.ram.boardex.board;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/restMenu")
public class RestMenuController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestMenuController.class);
	
	@Inject
	private MenuService service;

	@RequestMapping(value = "/getMenuList", method = RequestMethod.POST)
	public Map<String, Object> getMenuList() throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			result.put("menuList", service.getMenuList());
			          
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");

		}

		return result;
	}

	@RequestMapping(value = "/saveMenu", method = RequestMethod.POST)
	public Map<String, Object> saveMenu(MenuVO menuVO) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		
		logger.info("menu : "+menuVO.toString());
		
		
		try {
			service.saveMenu(menuVO);
			
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");

		}
		
		return result;
	}

	@RequestMapping(value = "/updateMenu", method = RequestMethod.POST)
	public Map<String, Object> updateMenu(MenuVO menuVO) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			service.updateMenu(menuVO);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
			
		}
		return result;
	}
	
	@RequestMapping(value = "/deleteMenu", method = RequestMethod.POST)
	public Map<String, Object> deleteMenu(@RequestParam("code") String code) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			service.deleteMenu(code);
			result.put("status", "OK");
		} catch (Exception e) {
			result.put("status", "False");
			
		}
		return result;
	}
	
	

}
