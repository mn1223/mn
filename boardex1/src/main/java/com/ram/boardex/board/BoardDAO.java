package com.ram.boardex.board;

import java.util.List;

import com.ram.boardex.common.Pagination;
import com.ram.boardex.common.Search;

public interface BoardDAO {
	
	public List<BoardVO> getBoardList(Search search) throws Exception;
	
	public BoardVO getBoardContent(int bno) throws Exception;
	
	public int insertBoard(BoardVO boardVO) throws Exception;
	
	public int updateBoard(BoardVO boardVO) throws Exception;
	
	public int deleteBoard(int bno) throws Exception;
	
	public int updateViewCnt(int bno) throws Exception;
	
	public int getBoardListCnt(Search search) throws Exception;
	
	public List<ReplyVO> getReplyList(int bno) throws Exception;
	
	public int saveReply(ReplyVO replyVO) throws Exception;
	
	public int updateReply(ReplyVO replyVO) throws Exception;
	
	public int deleteReply(int rno) throws Exception;
	
	
	
	public void addBoard() throws Exception;

}