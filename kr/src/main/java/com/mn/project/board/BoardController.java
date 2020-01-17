package com.mn.project.board;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mn.project.reply.ReplyVO;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	@Inject
	private BoardService service;



	//예외 처리
	@ExceptionHandler(RuntimeException.class)
	public String exceptionHandler(Model model, Exception e){

		model.addAttribute("exception", e);
		return "error/exception";
	}

	//홈 화면
	@RequestMapping(value="", method=RequestMethod.GET)
	public String home() {

		return "board";
	}

	/* 여기는 1번 게시판입니다--------------------------------------------------------------*/

	//게시글 목록 조회(1번 게시판)
	@RequestMapping(value="/getBoardListOne", method=RequestMethod.GET)
	public String getBoardListOne(Model model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "1") int range,
			@RequestParam(defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword,
			@ModelAttribute("search") Search search			
			) throws Exception {


		//검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);		

		//전체 게시글 개수
		int listCnt = service.getBoardListCntOne(search);

		//검색
		search.pageInfo(page, range, listCnt);

		//페이징				
		model.addAttribute("pagination", search);

		//게시글 화면 출력
		model.addAttribute("boardList", service.getBoardListOne(search));
		return "board/one/indexOne";

	}

	//게시글 작성(1번 게시판)
	@RequestMapping(value="/boardFormOne", method=RequestMethod.GET)
	public String boardFormOne(@ModelAttribute("boardVO") BoardVO vo, Model model) throws Exception {

		return "board/one/boardFormOne";
	}

	//게시글 저장 + 수정(1번 게시판)
	@RequestMapping(value = "/saveBoardOne", method = RequestMethod.POST)
	public String saveBoardOne(@ModelAttribute("boardVO") BoardVO vo,
			@RequestParam("mode") String mode,
			RedirectAttributes rttr) throws Exception {

		if(mode.equals("edit")) {
			service.updateBoard(vo);
		}else {
			service.insertBoardOne(vo);
		}

		return "redirect:/board/getBoardListOne";
	}

	//게시글 내용 상세보기(1번 게시판)
	@RequestMapping(value = "/getBoardContentOne", method = RequestMethod.GET)
	public String getBoardContentOne(Model model,@RequestParam("bno") int bno) throws Exception {

		//내용 출력
		model.addAttribute("boardContent", service.getBoardContent(bno));

		//댓글 출력
		model.addAttribute("replyVO", new ReplyVO());

		return "board/one/boardContentOne";
	}

	//게시글 수정 화면(1번 게시판)
	@RequestMapping(value = "/editFormOne", method = RequestMethod.GET)
	public String editFormOne(Model model,@RequestParam("bno") int bno,
			@RequestParam("mode") String mode) throws Exception {
		model.addAttribute("boardContent", service.getBoardContent(bno));
		model.addAttribute("mode", mode);
		model.addAttribute("boardVO", new BoardVO());
		return "board/one/boardFormOne";
	}

	//게시글 삭제(1번 게시판)
	@RequestMapping(value = "/deleteBoardOne", method = RequestMethod.GET)
	public String deleteBoardOne(RedirectAttributes rttr,
			@RequestParam("bno") int bno) throws Exception {
		service.deleteBoard(bno);
		return "redirect:/board/getBoardListOne";
	}


	/* 여기는 2번 게시판입니다--------------------------------------------------------------*/

	//게시글 전체 조회(2번 게시판)
	@RequestMapping(value="/getBoardListTwo", method=RequestMethod.GET)
	public String getBoardListTwo(Model model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "1") int range,
			@RequestParam(defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword,
			@ModelAttribute("search") Search search				
			) throws Exception {


		//검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);		

		//전체 게시글 개수
		int listCnt = service.getBoardListCntTwo(search);

		//검색
		search.pageInfo(page, range, listCnt);

		//페이징				
		model.addAttribute("pagination", search);


		//게시글 화면 출력
		model.addAttribute("boardList", service.getBoardListTwo(search));			
		return "board/two/indexTwo";
	}

	//게시글 작성(2번 게시판)
	@RequestMapping(value="/boardFormTwo", method=RequestMethod.GET)
	public String boardFormTwo(@ModelAttribute("boardVO") BoardVO vo, Model model) throws Exception {

		return "board/two/boardFormTwo";
	}

	//게시글 저장 + 수정(2번 게시판)
	@RequestMapping(value = "/saveBoardTwo", method = RequestMethod.POST)
	public String saveBoardTwo(@ModelAttribute("boardVO") BoardVO vo,
			@RequestParam("mode") String mode,
			RedirectAttributes rttr) throws Exception {

		if(mode.equals("edit")) {
			service.updateBoard(vo);
		}else {
			service.insertBoardTwo(vo);
		}

		return "redirect:/board/getBoardListTwo";
	}

	//게시글 내용 상세보기(2번 게시판)
	@RequestMapping(value = "/getBoardContentTwo", method = RequestMethod.GET)
	public String getBoardContentTwo(Model model,@RequestParam("bno") int bno) throws Exception {

		//내용 출력
		model.addAttribute("boardContent", service.getBoardContent(bno));

		//댓글 출력
		model.addAttribute("replyVO", new ReplyVO());

		return "board/two/boardContentTwo";
	}

	//게시글 수정 화면(2번 게시판)
	@RequestMapping(value = "/editFormTwo", method = RequestMethod.GET)
	public String editFormTwo(Model model,@RequestParam("bno") int bno,
			@RequestParam("mode") String mode) throws Exception {
		model.addAttribute("boardContent", service.getBoardContent(bno));
		model.addAttribute("mode", mode);
		model.addAttribute("boardVO", new BoardVO());
		return "board/two/boardFormTwo";
	}

	//게시글 삭제(2번 게시판)
	@RequestMapping(value = "/deleteBoardTwo", method = RequestMethod.GET)
	public String deleteBoardTwo(RedirectAttributes rttr,
			@RequestParam("bno") int bno) throws Exception {
		service.deleteBoard(bno);
		return "redirect:/board/getBoardListTwo";
	}	


	/* 여기부터는 3번 게시판입니다--------------------------------------------------------------*/

	//게시글 전체 조회(3번 게시판)
	@RequestMapping(value="/getBoardListThree", method=RequestMethod.GET)
	public String getBoardListThree(Model model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "1") int range,
			@RequestParam(defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword,
			@ModelAttribute("search") Search search				
			) throws Exception {


		//검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);		

		//전체 게시글 개수
		int listCnt = service.getBoardListCntThree(search);

		//검색
		search.pageInfo(page, range, listCnt);

		//페이징				
		model.addAttribute("pagination", search);


		//게시글 화면 출력
		model.addAttribute("boardList", service.getBoardListThree(search));			
		return "board/three/indexThree";
	}

	//게시글 작성(3번 게시판)
	@RequestMapping(value="/boardFormThree", method=RequestMethod.GET)
	public String boardFormThree(@ModelAttribute("boardVO") BoardVO vo, Model model) throws Exception {

		return "board/three/boardFormThree";
	}

	//게시글 저장 + 수정(3번 게시판)
	@RequestMapping(value = "/saveBoardThree", method = RequestMethod.POST)
	public String saveBoardThree(@ModelAttribute("boardVO") BoardVO vo,
			@RequestParam("mode") String mode,
			RedirectAttributes rttr) throws Exception {

		if(mode.equals("edit")) {
			service.updateBoard(vo);
		}else {
			service.insertBoardThree(vo);
		}

		return "redirect:/board/getBoardListThree";
	}

	//게시글 내용 상세보기(3번 게시판)
	@RequestMapping(value = "/getBoardContentThree", method = RequestMethod.GET)
	public String getBoardContentThree(Model model,@RequestParam("bno") int bno) throws Exception {

		//내용 출력
		model.addAttribute("boardContent", service.getBoardContent(bno));

		//댓글 출력
		model.addAttribute("replyVO", new ReplyVO());

		return "board/three/boardContentThree";
	}

	//게시글 수정 화면(3번 게시판)
	@RequestMapping(value = "/editFormThree", method = RequestMethod.GET)
	public String editFormThree(Model model,@RequestParam("bno") int bno,
			@RequestParam("mode") String mode) throws Exception {
		model.addAttribute("boardContent", service.getBoardContent(bno));
		model.addAttribute("mode", mode);
		model.addAttribute("boardVO", new BoardVO());
		return "board/three/boardFormThree";
	}

	//게시글 삭제(3번 게시판)
	@RequestMapping(value = "/deleteBoardThree", method = RequestMethod.GET)
	public String deleteBoardThree(RedirectAttributes rttr,
			@RequestParam("bno") int bno) throws Exception {
		service.deleteBoard(bno);
		return "redirect:/board/getBoardListThree";
	}	





	/* 여기는 4번 게시판입니다--------------------------------------------------------------*/


	//게시글 전체 조회(4번 게시판)
	@RequestMapping(value="/getBoardListFour", method=RequestMethod.GET)
	public String getBoardListFour(Model model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "1") int range,
			@RequestParam(defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword,
			@ModelAttribute("search") Search search				
			) throws Exception {


		//검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);		

		//전체 게시글 개수
		int listCnt = service.getBoardListCntFour(search);

		//검색
		search.pageInfo(page, range, listCnt);

		//페이징				
		model.addAttribute("pagination", search);


		//게시글 화면 출력
		model.addAttribute("boardList", service.getBoardListFour(search));			
		return "board/four/indexFour";
	}

	//게시글 작성(4번 게시판)
	@RequestMapping(value="/boardFormFour", method=RequestMethod.GET)
	public String boardFormFour(@ModelAttribute("boardVO") BoardVO vo, Model model) throws Exception {

		return "board/four/boardFormFour";
	}

	//게시글 저장 + 수정(4번 게시판)
	@RequestMapping(value = "/saveBoardFour", method = RequestMethod.POST)
	public String saveBoardFour(@ModelAttribute("boardVO") BoardVO vo,
			@RequestParam("mode") String mode,
			RedirectAttributes rttr) throws Exception {

		if(mode.equals("edit")) {
			service.updateBoard(vo);
		}else {
			service.insertBoardFour(vo);
		}

		return "redirect:/board/getBoardListFour";
	}

	//게시글 내용 상세보기(4번 게시판)
	@RequestMapping(value = "/getBoardContentFour", method = RequestMethod.GET)
	public String getBoardContentFour(Model model,@RequestParam("bno") int bno) throws Exception {

		//내용 출력
		model.addAttribute("boardContent", service.getBoardContent(bno));

		//댓글 출력
		model.addAttribute("replyVO", new ReplyVO());

		return "board/four/boardContentFour";
	}

	//게시글 수정 화면(4번 게시판)
	@RequestMapping(value = "/editFormFour", method = RequestMethod.GET)
	public String editFormFour(Model model,@RequestParam("bno") int bno,
			@RequestParam("mode") String mode) throws Exception {
		model.addAttribute("boardContent", service.getBoardContent(bno));
		model.addAttribute("mode", mode);
		model.addAttribute("boardVO", new BoardVO());
		return "board/four/boardFormFour";
	}

	//게시글 삭제(4번 게시판)
	@RequestMapping(value = "/deleteBoardFour", method = RequestMethod.GET)
	public String deleteBoardFour(RedirectAttributes rttr,
			@RequestParam("bno") int bno) throws Exception {
		service.deleteBoard(bno);
		return "redirect:/board/getBoardListFour";
	}

	/* 여기는 5번 게시판입니다--------------------------------------------------------------*/

	//게시글 전체 조회(5번 게시판)
	@RequestMapping(value="/getBoardListFive", method=RequestMethod.GET)
	public String getBoardListFive(Model model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "1") int range,
			@RequestParam(defaultValue = "title") String searchType,
			@RequestParam(required = false) String keyword,
			@ModelAttribute("search") Search search				
			) throws Exception {


		//검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);		

		//전체 게시글 개수
		int listCnt = service.getBoardListCntFive(search);

		//검색
		search.pageInfo(page, range, listCnt);

		//페이징				
		model.addAttribute("pagination", search);


		//게시글 화면 출력
		model.addAttribute("boardList", service.getBoardListFive(search));			
		return "board/five/indexFive";
	}

	//게시글 작성(5번 게시판)
	@RequestMapping(value="/boardFormFive", method=RequestMethod.GET)
	public String boardFormFive(@ModelAttribute("boardVO") BoardVO vo, Model model) throws Exception {

		return "board/five/boardFormFive";
	}

	//게시글 저장 + 수정(5번 게시판)
	@RequestMapping(value = "/saveBoardFive", method = RequestMethod.POST)
	public String saveBoardFive(@ModelAttribute("boardVO") BoardVO vo,
			@RequestParam("mode") String mode,
			RedirectAttributes rttr) throws Exception {

		if(mode.equals("edit")) {
			service.updateBoard(vo);
		}else {
			service.insertBoardFive(vo);
		}

		return "redirect:/board/getBoardListFive";
	}

	//게시글 내용 상세보기(5번 게시판)
	@RequestMapping(value = "/getBoardContentFive", method = RequestMethod.GET)
	public String getBoardContentFive(Model model,@RequestParam("bno") int bno) throws Exception {

		//내용 출력
		model.addAttribute("boardContent", service.getBoardContent(bno));

		//댓글 출력
		model.addAttribute("replyVO", new ReplyVO());

		return "board/five/boardContentFive";
	}

	//게시글 수정 화면(5번 게시판)
	@RequestMapping(value = "/editFormFive", method = RequestMethod.GET)
	public String editFormFive(Model model,@RequestParam("bno") int bno,
			@RequestParam("mode") String mode) throws Exception {
		model.addAttribute("boardContent", service.getBoardContent(bno));
		model.addAttribute("mode", mode);
		model.addAttribute("boardVO", new BoardVO());
		return "board/five/boardFormFive";
	}

	//게시글 삭제(5번 게시판)
	@RequestMapping(value = "/deleteBoardFive", method = RequestMethod.GET)
	public String deleteBoardFive(RedirectAttributes rttr,
			@RequestParam("bno") int bno) throws Exception {
		service.deleteBoard(bno);
		return "redirect:/board/getBoardListFive";
	}

	/* 여기는 6번 게시판입니다--------------------------------------------------------------*/
	
	//게시글 전체 조회(6번 게시판)
		@RequestMapping(value="/getBoardListSix", method=RequestMethod.GET)
		public String getBoardListSix(Model model,
				@RequestParam(defaultValue = "1") int page,
				@RequestParam(defaultValue = "1") int range,
				@RequestParam(defaultValue = "title") String searchType,
				@RequestParam(required = false) String keyword,
				@ModelAttribute("search") Search search				
				) throws Exception {


			//검색
			model.addAttribute("search", search);
			search.setSearchType(searchType);
			search.setKeyword(keyword);		

			//전체 게시글 개수
			int listCnt = service.getBoardListCntSix(search);

			//검색
			search.pageInfo(page, range, listCnt);

			//페이징				
			model.addAttribute("pagination", search);


			//게시글 화면 출력
			model.addAttribute("boardList", service.getBoardListSix(search));			
			return "board/six/indexSix";
		}

		//게시글 작성(6번 게시판)
		@RequestMapping(value="/boardFormSix", method=RequestMethod.GET)
		public String boardFormSix(@ModelAttribute("boardVO") BoardVO vo, Model model) throws Exception {

			return "board/six/boardFormSix";
		}

		//게시글 저장 + 수정(6번 게시판)
		@RequestMapping(value = "/saveBoardSix", method = RequestMethod.POST)
		public String saveBoardSix(@ModelAttribute("boardVO") BoardVO vo,
				@RequestParam("mode") String mode,
				RedirectAttributes rttr) throws Exception {

			if(mode.equals("edit")) {
				service.updateBoard(vo);
			}else {
				service.insertBoardSix(vo);
			}

			return "redirect:/board/getBoardListSix";
		}

		//게시글 내용 상세보기(6번 게시판)
		@RequestMapping(value = "/getBoardContentSix", method = RequestMethod.GET)
		public String getBoardContentSix(Model model,@RequestParam("bno") int bno) throws Exception {

			//내용 출력
			model.addAttribute("boardContent", service.getBoardContent(bno));

			//댓글 출력
			model.addAttribute("replyVO", new ReplyVO());

			return "board/six/boardContentSix";
		}

		//게시글 수정 화면(6번 게시판)
		@RequestMapping(value = "/editFormSix", method = RequestMethod.GET)
		public String editFormSix(Model model,@RequestParam("bno") int bno,
				@RequestParam("mode") String mode) throws Exception {
			model.addAttribute("boardContent", service.getBoardContent(bno));
			model.addAttribute("mode", mode);
			model.addAttribute("boardVO", new BoardVO());
			return "board/six/boardFormSix";
		}

		//게시글 삭제(6번 게시판)
		@RequestMapping(value = "/deleteBoardSix", method = RequestMethod.GET)
		public String deleteBoardSix(RedirectAttributes rttr,
				@RequestParam("bno") int bno) throws Exception {
			service.deleteBoard(bno);
			return "redirect:/board/getBoardListSix";
		}

}