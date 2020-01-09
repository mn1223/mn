package com.mn.project.login;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RestController;

import com.mn.project.util.SessionClass;

@RestController
public class RestMypageController {
	
	
	@Inject
	private LoginService service;
	
	@Inject
	private SessionClass session;
	
	
	@RequestMapping(value="/ckkkkk" , method = RequestMethod.POST)
    public Map<String,Object> infoUpdate(@RequestBody LoginVO loginVO,HttpServletRequest request) throws Exception{
		Map<String,Object> result = new HashMap<>();
		
		System.out.println(loginVO+"1234");
		try {
			service.update(loginVO);
			result.put("mes","수정 완료");
		}
		catch(Exception e) {
			result.put("mes","실패");
			e.printStackTrace();
		}
		
		return result;
	}
	

	@RequestMapping(value="/checking", method =RequestMethod.GET)
	public Map<String,Object> dupli(@RequestParam("useridr") String userid) throws Exception{
		LoginVO loginVO= new LoginVO();
		loginVO.setMmid(userid);
		System.out.println(userid);
		int count = 0;
		Map<String,Object> map = new HashMap<>();
		
		count =service.duplicate(loginVO);
		map.put("cnt",count);
		return map;
	}
}
