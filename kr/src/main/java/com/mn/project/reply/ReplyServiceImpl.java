package com.mn.project.reply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> getReplyList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.getReplyList(bno);
	}

	@Override
	public int saveReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.saveReply(vo);
	}

	@Override
	public int updateReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateReply(vo);
	}

	@Override
	public int deleteReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteReply(rno);
	}

}
