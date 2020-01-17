package com.ram.boardex.board;

import java.util.List;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ram.boardex.common.Pagination;
import com.ram.boardex.common.Search;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession session;
	
	static String namespace = "com.ram.boardex.mappers.BoardMapper";
	static String namespacere = "com.ram.boardex.mappers.ReplyMapper";
	
	@Override
	public List<BoardVO> getBoardList(Search search) throws Exception {
		
		return session.selectList(namespace+".getBoardList",search);
	}

	@Override
	public BoardVO getBoardContent(int bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getBoardContent",bno);
	}

	@Override
	public int insertBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace+".insertBoard",boardVO);
	}

	@Override
	public int updateBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+".updateBoard", boardVO);
	}

	@Override
	public int deleteBoard(int bno) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace+".deleteBoard",bno);
	}

	@Override
	public int updateViewCnt(int bno) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+".updateViewCnt",bno);
	}
	
	@Override
	public void addBoard() throws Exception {
		
		BoardVO boardVO = new BoardVO();
		
		
		for(int i = 87;i<200;i++) {
		boardVO.setCate_cd("1");
		boardVO.setTag("테스트"+i);
		boardVO.setText("페이지 테스트 "+i);
		boardVO.setTitle("페이징 테스트 "+i);
		boardVO.setReg_id("페이징 테스트"+i);
		session.insert(namespace+".insertBoard",boardVO);
		}
	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getBoardListCnt",search);
	}
	
	

	@Override
	public List<ReplyVO> getReplyList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespacere+".getReplyList",bno);
	}

	@Override
	public int saveReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespacere+".saveReply", replyVO);
	}

	@Override
	public int updateReply(ReplyVO replyVO) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespacere+".updateReply",replyVO);
	}

	@Override
	public int deleteReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespacere+".deleteReply",rno);
	}
	
	
	
}
