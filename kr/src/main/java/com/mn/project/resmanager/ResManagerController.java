 package com.mn.project.resmanager;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
@RequestMapping(value="/matchmaker")

public class ResManagerController {
	@Inject
	private ResManagerService service;
	
	@RequestMapping(value="/managermain")
	public String managermain(Principal principal,Model model) {
		
		return "matchmaker/managermain";
	}
	
	@RequestMapping(value="/member", method= RequestMethod.GET)
	public String memeber(@RequestParam(required=false) String keyword, Model model) throws Exception{
		List<ResManagerVO> list;
		if(keyword!=null) {
			list = service.view(keyword);
		}else {
			list = service.list();
		}
		model.addAttribute("list", list);
		return "matchmaker/member";
	}
	
	@ResponseBody
	@RequestMapping(value="/mmupdate" ,method= RequestMethod.POST)
	public String mmupdate(@RequestParam String mmid,@RequestParam String mmgrade) throws Exception {
		String returnVal="false";
		ResManagerVO resManagerVO = new ResManagerVO();
		resManagerVO.setMmid(mmid);
		resManagerVO.setMmgrade(mmgrade);
		if(service.mmupdate(resManagerVO)==1) {
			returnVal = resManagerVO.getMmgrade();
		}
		return returnVal;
	}
	
	@RequestMapping(value="/party", method=RequestMethod.GET)
	public String party(Model model) throws Exception {
		model.addAttribute("tbook", service.pSearch());
		return "matchmaker/party";
	}
	
	@ResponseBody
	@RequestMapping(value="/party", method = RequestMethod.POST)
	public String pReg(@RequestParam String pDate,@RequestParam String pLoc,
			@RequestParam int pCnt, @RequestParam int pPrice, PartyManagerVO partyManagerVO) throws Exception {
		String returnVal = "false";
		System.out.println(partyManagerVO);
		//System.out.println(pDate+""+pLoc+""+pCnt+""+pPrice);
		if(service.pReg(partyManagerVO)==1) {
			returnVal = "true";
		}
		return returnVal;
	}

	@ResponseBody
	@RequestMapping(value="/pDel", method= {RequestMethod.GET,RequestMethod.POST})
	public String pDel(@RequestParam String pDate) throws Exception {
		String returnVal = "false";
		//System.out.println(pDate);
		if(service.pDel(pDate)==1) {
			returnVal = "true";
		}
		return returnVal;
	}
	

	@RequestMapping(value="/reservation", method=RequestMethod.GET)
	public String reservation(Model model) throws Exception{
		model.addAttribute("tbook", service.pSearch());
		return "matchmaker/reservation";
	}
	

	@ResponseBody
	@RequestMapping(value="/puSearch", method=RequestMethod.POST)
	public List<PartyReservationVO> uInfo(@RequestParam String pDate, Model model) throws Exception {
		List<PartyReservationVO> puList;
		//System.out.println(pDate);
		puList = service.puSearch(pDate);
		//System.out.println(puList);
		return puList;
	}

	@ResponseBody
	@RequestMapping(value="/puUpd", method=RequestMethod.POST)
	public String puUpd(@RequestParam String mmid,@RequestParam String ubookdeposit
						, @RequestParam String ubookstatus, @RequestParam String pdate){
		String returnVal = "false";
		PartyReservationVO vo = new PartyReservationVO();
	
		vo.setUbookstatus(ubookstatus);
		vo.setUbookdeposit(ubookdeposit);
		vo.setMmid(mmid);
		vo.setPdate(pdate);
		System.out.println(vo);
		System.out.println(mmid + " " +ubookdeposit+ " " + ubookstatus);
		try {
			if(service.puUpd(vo)==1) {
				returnVal = "true";
				System.out.println(returnVal);
			}
			System.out.println("controller start");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("controller end");
		}
		
		return returnVal;
	}
}
