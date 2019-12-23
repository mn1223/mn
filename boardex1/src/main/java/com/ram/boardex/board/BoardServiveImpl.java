package com.ram.boardex.board;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ram.boardex.common.Pagination;
import com.ram.boardex.common.Search;



@Service
public class BoardServiveImpl implements BoardService{

	@Inject
	BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> getBoardList(Search search) throws Exception {
		
		return boardDAO.getBoardList(search);
	}

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		
		boardDAO.insertBoard(boardVO);
	}

	@Override
	public BoardVO getBoardContent(int bno) throws Exception {
		
			boardDAO.updateViewCnt(bno);
			
		return boardDAO.getBoardContent(bno);
	}

	@Override
	public int updateBoard(BoardVO boardVO) throws Exception {
		
		return boardDAO.updateBoard(boardVO);
	}

	@Override
	public void deleteBoard(int bno) throws Exception {
		
		boardDAO.deleteBoard(bno);
	}
	
	@Override
	public void addBoard() throws Exception {
		
		boardDAO.addBoard();
	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {
		
		return boardDAO.getBoardListCnt(search);
	}

	@Override
	public List<ReplyVO> getReplyList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.getReplyList(bno);
	}

	@Override
	public int saveReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.saveReply(replyVO);
	}

	@Override
	public int updateReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.updateReply(replyVO);
	}

	@Override
	public int deleteReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.deleteReply(rno);
	}
	
	

}
