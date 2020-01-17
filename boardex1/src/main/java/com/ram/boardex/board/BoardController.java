package com.ram.boardex.board;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ram.boardex.common.Pagination;
import com.ram.boardex.common.Search;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Inject
	BoardService service;
	
	@RequestMapping(value="/getBoardList",method=RequestMethod.GET)
	public String getBoardList(Model model,@RequestParam(required = false,defaultValue="1") int page,@RequestParam(required = false,defaultValue="1") int range,@RequestParam(required = false,defaultValue="title") String searchType,@RequestParam(required=false)String keyword) throws Exception {
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int listCnt = service.getBoardListCnt(search);
		
		
		
		search.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", search);
		
		List<BoardVO> list = null;
		list = service.getBoardList(search);
		
		model.addAttribute("boardList",list);
			
		return "board/index";
	}
	
	
	@RequestMapping("/boardForm")
	public String boardForm(@ModelAttribute("boardVO") BoardVO boardVO, Model model) {

		return "board/boardForm";
	}
	
	
	@RequestMapping(value="/saveBoard", method=RequestMethod.POST)
	public String insertBoard(@ModelAttribute("BoardVO") BoardVO boardVO,@RequestParam("mode") String mode, RedirectAttributes rttr) throws Exception{
		
		if(mode.equals("edit")) {
			service.updateBoard(boardVO);
		}else {
			System.out.println(boardVO);
			service.insertBoard(boardVO);
		}	
		return "redirect:/board/getBoardList";
	}
	
	@RequestMapping(value="/getBoardContent",method= {RequestMethod.GET,RequestMethod.POST})
	public String getBoardContent(Model model,@RequestParam("bno") int bno) throws Exception{
		
		model.addAttribute("boardContent",service.getBoardContent(bno));
		
		model.addAttribute("replyVO",new ReplyVO());
		
		return "board/boardContent";
	}
	
	@RequestMapping(value="/editForm", method=RequestMethod.GET)
	public String editForm(@RequestParam("bno")int bno,Model model,@RequestParam("mode")String mode) throws Exception {
		
		model.addAttribute("boardContent",service.getBoardContent(bno));
		
		System.out.println(service.getBoardContent(bno));
		
		model.addAttribute("mode",mode);
		
		model.addAttribute("boardVO", new BoardVO());
		
		return "board/boardForm";
	}
	
	@RequestMapping(value="/deleteBoard",method=RequestMethod.GET)
	public String deleteForm(@RequestParam("bno") int bno) throws Exception {
		
		service.deleteBoard(bno);
		
		return "redirect:/board/getBoardList";
	}
	
	@RequestMapping(value = "/addBoard",method=RequestMethod.GET)
	public String addBoard() throws Exception{
		
		service.addBoard();
		
		return "redirect:/getBoardList";
	}
	
	
	
}
