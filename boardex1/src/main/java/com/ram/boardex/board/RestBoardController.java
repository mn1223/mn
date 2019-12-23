package com.ram.boardex.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/restBoard")
public class RestBoardController {
	
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/getReplyList",method = RequestMethod.POST)
	public List<ReplyVO> getReplyList(@RequestParam("bno") int bno) throws Exception{
		
		
		return service.getReplyList(bno);
	}
	
	
	//댓글 쓰기
	@RequestMapping(value = "/saveReply",method = RequestMethod.POST)
	public Map<String,Object> saveReply(@RequestBody ReplyVO replyVO) throws Exception{
		Map<String,Object> result = new HashMap<>();
		try {
			service.saveReply(replyVO);
			result.put("status","OK");
		
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		System.out.println("??");
		
		return result;	
	}
	@RequestMapping(value="/updateReply",method = RequestMethod.POST)
	public Map<String,Object> updateReply(@RequestBody ReplyVO replyVO) throws Exception{
		Map<String,Object> result = new HashMap<>();
		
		try {
			service.updateReply(replyVO);
			result.put("status", "OK");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result; 
	}
	
	@RequestMapping(value="/deleteReply",method = RequestMethod.POST)
	public Map<String,Object> deleteReply(@RequestParam("rno") int rno)throws Exception{
		Map<String,Object> result = new HashMap<>();
		
		try {
			service.deleteReply(rno);
			result.put("status", "OK");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status","False");
		}
		
		
		return result;
	}
}
