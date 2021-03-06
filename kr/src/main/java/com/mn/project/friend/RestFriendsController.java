package com.mn.project.friend;

import java.io.BufferedReader;


import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.mn.project.login.LoginService;
import com.mn.project.login.LoginVO;
import com.mn.project.util.SessionClass;

import SchoolAPI.ItemList;
import SchoolAPI.SchoolVO;



@RestController
public class RestFriendsController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	private static final ObjectMapper MAPPER = new ObjectMapper();

	@Inject
	private LoginService service;
	
	@Inject
	FriendService friendService;

	@Inject
	SessionClass session;

	@RequestMapping(value = "/searchData1", method = RequestMethod.POST)
	public List<FriendVO> getSearchData(@RequestBody FriendVO vo,Principal principal) {
		System.out.println(vo);
		System.out.println(principal.getName());
		List<FriendVO> list = friendService.searchData(vo);

		System.out.println(list);

		return list;
	}

	@RequestMapping(value = "/addFriend", method = RequestMethod.GET)
	public Map<String, Object> addFriendList(@RequestParam("yourid") String yourid,Principal principal) {
		Map<String, Object> result = new HashMap<>();
		FriendVO vo = new FriendVO();

		vo.setYourid(yourid);
		vo.setMyid(principal.getName());

		System.out.println(vo);

		try {
			friendService.addFriendList(vo);
			result.put("result", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "FALSE");
		}

		return result;
	}

	@RequestMapping(value = "/judgeFriend", method = RequestMethod.GET)
	public List<FriendVO> judgeFriend(@RequestParam("myid") String myid) {
		List<FriendVO> list = null;
		FriendVO vo = new FriendVO();
		vo.setMyid(myid);

		list = friendService.judgeFirend(vo);
		System.out.println(list);

		return list;
	}

	@RequestMapping(value = "/getFriendFalse", method = RequestMethod.GET)
	public List<FriendVO> getFriendFalse(@RequestParam("myid") String myid) {
		FriendVO vo = new FriendVO();
		List<FriendVO> list = null;
		vo.setMyid(myid);

		list = friendService.getFriendFalse(vo);

		System.out.println(list);

		return list;
	}

	@RequestMapping(value = "/getMyFriendFalse", method = RequestMethod.GET)
	public List<FriendVO> getMyFriendFalse(@RequestParam("myid") String myid) {
		FriendVO vo = new FriendVO();
		List<FriendVO> list = null;
		vo.setMyid(myid);

		list = friendService.getMyFriendFalse(vo);

		System.out.println(list);

		return list;
	}

	@RequestMapping(value = "/getFriendTrue", method = RequestMethod.GET)
	public List<FriendVO> getFriendTrue(@RequestParam("myid") String myid) {
		FriendVO vo = new FriendVO();
		List<FriendVO> list = null;
		vo.setMyid(myid);

		list = friendService.getFriendTrue(vo);

		System.out.println(list);

		return list;
	}

	@RequestMapping(value = "/addFriendTrue", method = RequestMethod.GET)
	public Map<String, Object> addFriendTrue(@RequestParam("myid") String myid, @RequestParam("yourid") String yourid) {
		Map<String, Object> result = new HashMap<>();
		FriendVO vo = new FriendVO();
		vo.setMyid(myid);
		vo.setYourid(yourid);

		System.out.println(vo);
		try {
			friendService.addFriendTrue(vo);
			friendService.addFriendListTrue(vo);
			result.put("mes", "추가 완료");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("mes", "실패");
		}

		return result;
	}

	@RequestMapping(value = "/DeleteFriendFalse", method = RequestMethod.GET)
	public Map<String, Object> DeleteFriendFalse(@RequestParam("myid") String myid,
			@RequestParam("yourid") String yourid, @RequestParam("status") String status) {
		Map<String, Object> result = new HashMap<>();
		FriendVO vo = new FriendVO();
		vo.setMyid(myid);
		vo.setYourid(yourid);

		if (status.equals("F")) {
			friendService.deleteFriendListFalse(vo);
		} else {
			System.out.println("??");
			System.out.println(vo);
			friendService.deleteFriendListTrue(vo);
			friendService.deleteFriendStatus(vo);
		}

		return result;
	}

	@RequestMapping(value = "/schoolSearch", method =RequestMethod.GET)
	public List<SchoolVO> findSchool(@RequestParam(value = "gubun", defaultValue = "elem_list") String gubun,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "region", required = false) String region,
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "pageSize", defaultValue = "15") Integer pageSize, HttpServletRequest request,
			HttpServletResponse response,Model model) {
		
		String encodeResult = URLEncoder.encode(name);
		
		String urls = "http://www.career.go.kr/cnet/openapi/getOpenApi.json?apiKey=3e18babb4587b2528cc9032f119ab990&svcType=api&svcCode=SCHOOL&contentType=json";
		urls += "&gubun="+gubun;
		urls += "&region="+region;
		urls += "&searchSchulNm="+encodeResult;
		System.out.println(urls);
		System.out.println(encodeResult);
		ItemList items = new ItemList(Collections.EMPTY_LIST, 0);
		 List<SchoolVO> list = new ArrayList<SchoolVO>();
		try {
			   URL url = new URL(urls);
			   URLConnection connection = url.openConnection();
			   InputStream is = connection.getInputStream();
			   JsonNode jn = MAPPER.readTree(is);
			   JsonNode jn2 = jn.get("dataSearch").get("content");
			   Iterator<JsonNode> iter = jn2.elements();
			  
			   while(iter.hasNext()){
			    JsonNode jn3 = iter.next();
			    if( items.getTotalCount() == 0 )
			        items.setTotalCount(jn3.get("totalCount").asInt());    
			    list.add(new SchoolVO(
			      jn3.get("schoolName").textValue(),jn3.get("adres").textValue()    
			      ));
			   } 
			 
			   items.setItems(list);
			 
			  } catch (Exception e) {
			   logger.error("CAREER API ERROR", e);
			  }		
		System.out.println(list);
		return list;
	}
	
	@RequestMapping(value="schoolUpd",method = RequestMethod.POST)
	public void schoolUpd(@RequestBody FriendVO friendVO,Principal principal) {
		friendVO.setScmmid(principal.getName());
		System.out.println(friendVO);
		friendService.schoolUpd(friendVO);
	}
	
	@RequestMapping(value="getInfo",method =RequestMethod.GET)
	public FriendVO getInfo(@RequestParam("yourid") String yourid,Model model) throws Exception{
		LoginVO loginVO = new LoginVO();
		loginVO.setMmid(yourid);
		
		FriendVO friendVO = service.getSchoolInfo(loginVO);
		System.out.println(friendVO);
		model.addAttribute("scinfo",friendVO);
		
		return friendVO;	
	}

}
