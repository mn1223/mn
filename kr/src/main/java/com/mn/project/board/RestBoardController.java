package com.mn.project.board;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.mn.project.reply.ReplyService;
import com.mn.project.reply.ReplyVO;

@RestController
@RequestMapping(value = "/restBoard")
public class RestBoardController {

	@Inject
	private ReplyService service;

	// 댓글 리스트 출력
	@RequestMapping(value = "/getReplyList", method = RequestMethod.POST)
	public List<ReplyVO> getReplyList(@RequestParam("bno") int bno) throws Exception {
		return service.getReplyList(bno);
	}

	// 댓글 작성
	@RequestMapping(value = "/saveReply", method = RequestMethod.POST)
	public Map<String, Object> saveReply(@RequestBody ReplyVO vo) throws Exception {
		Map<String, Object> result = new HashMap<>();

		try {
			service.saveReply(vo);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}

		return result;
	}

	// 댓글 수정
	@RequestMapping(value = "/updateReply", method = RequestMethod.POST)
	public Map<String, Object> updateReply(@RequestBody ReplyVO vo) throws Exception {
		Map<String, Object> result = new HashMap<>();

		try {
			service.updateReply(vo);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}

		return result;
	}

	// 댓글 삭제
	@RequestMapping(value = "/deleteReply", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> deleteReply(@RequestParam("rno") int rno) throws Exception {
		Map<String, Object> result = new HashMap<>();

		try {
			service.deleteReply(rno);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}

		return result;
	}


	//이미지 업로드!!	
	@RequestMapping(value="/imageUpload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> imageUpload(HttpServletRequest req, HttpServletResponse resp, 
			@RequestParam MultipartFile upload) throws Exception {
		OutputStream out = null;
		JsonObject json = new JsonObject();
		String fileUrl = "";
		String uploadPath = "";
		PrintWriter printWriter = null;
		
		try {
			String fileName = upload.getName();
			byte[] bytes = upload.getBytes();
			uploadPath = req.getSession().getServletContext().getRealPath("/resources/img");
			
			File uploadFile = new File(uploadPath);
			if(!uploadFile.exists()) {
				uploadFile.mkdirs();
			}
			fileName = UUID.randomUUID().toString() + ".jpg";
			uploadPath = uploadPath + "/" + fileName;
			
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			
			printWriter = resp.getWriter();
			resp.setContentType("text/html");
			fileUrl = req.getContextPath() + "/resources/img/" + fileName; //url경로
			
			
			json.addProperty("fileName", fileName);
			json.addProperty("uploaded", 1);
			json.addProperty("url", fileUrl);
			
			printWriter.println(json);
		}catch(IOException e) {
			e.printStackTrace();
			
		}finally {
			if(out != null) {
				out.close();
			}
			if(printWriter != null) {
				printWriter.close();
			}
		}
		
			return null;
	}





}// 끝

















