package com.mn.project.reply;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession sql;
	
	private final String namespace = "com.mn.project.mappers.replyMapper";
	
	//댓글 리스트 출력
	@Override
	public List<ReplyVO> getReplyList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".getReplyList", bno);
	}
	
	//댓글 작성
	@Override
	public int saveReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.insert(namespace + ".saveReply", vo);
	}
	
	//댓글 수정
	@Override
	public int updateReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.update(namespace + ".updateReply", vo);
	}
	
	//댓글 삭제
	@Override
	public int deleteReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return sql.delete(namespace + ".deleteReply", rno);
	}

}
