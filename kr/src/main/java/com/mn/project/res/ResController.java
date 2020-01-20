package com.mn.project.res;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/user")
public class ResController {
	@Inject
	private ResService service;


	@RequestMapping(value="/user", method= RequestMethod.GET)
	public String pIns(Model model,Principal principal) throws Exception {
		model.addAttribute("tbook", service.pSearch());
		model.addAttribute("myid",principal.getName());
		return "user/user";
	}

	@ResponseBody
	@RequestMapping(value="/getPno",method = RequestMethod.GET)
	public List<ResVO> getPno(@RequestParam("pdate") String date) throws Exception {
		List<ResVO> list = null;
		ResVO vo = new ResVO();
		vo.setpDate(date);
		list=service.getPno(vo);
		System.out.println(list);
		return list;
	}


	@ResponseBody
	@RequestMapping(value="/insParty", method = RequestMethod.POST)
	public String insParty(@RequestParam("pno") int pno, @RequestParam("ubookmmid") String ubookmmid) throws Exception{
		String returnVal = "false";
		ResVO vo = new ResVO();
		vo.setPno(pno);
		vo.setUbookmmid(ubookmmid);

		System.out.println(vo);
		if(service.check(vo)==0) {
			if(service.insParty(vo)==1) {
				returnVal="true";
			}
		}else {
			returnVal = "NN";
		}
		
		System.out.println(vo);
		return returnVal;
	}
	
	//실시간 예약 현황
	@ResponseBody
	@RequestMapping(value="/uInfo", method=RequestMethod.POST)
	public List<ResVO> uInfo(@RequestParam("ubookmmid") String ubookmmid) throws Exception {
		List<ResVO> list = null;
		
		return list;
	}

}
