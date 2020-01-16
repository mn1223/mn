package com.mn.project.reply;

import java.util.List;

public interface ReplyService {
	//댓글 리스트 출력
		public List<ReplyVO> getReplyList(int bno) throws Exception;
		
		//댓글 작성
		public int saveReply(ReplyVO vo) throws Exception;
		
		//댓글 수정
		public int updateReply(ReplyVO vo) throws Exception;
		
		//댓글 삭제
		public int deleteReply(int rno) throws Exception;
}
