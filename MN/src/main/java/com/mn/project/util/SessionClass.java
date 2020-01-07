package com.mn.project.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class SessionClass {
	HttpSession session;
	
	public void getSessionId(HttpServletRequest req) {
		session = req.getSession();
	}
	
	public void setId(String at,String id) {
		session.setAttribute(at, id);
	}
	
	public String getId(String member) {	
		return (String) session.getAttribute(member);
	}
	
	
	
}
