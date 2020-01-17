package com.mn.project.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sql;

	private final String namespace ="com.mn.project.mappers.boardMapper";

	//게시글 상세보기
	@Override
	public BoardVO getBoardContent(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".getBoardContent", bno);
	}

	//게시글 수정	
	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".updateBoard", vo);
	}

	//게시글 삭제
	@Override
	public void deleteBoard(int bno) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".deleteBoard", bno);
	}

	//조회수 변경
	@Override
	public int updateViewCnt(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.update(namespace + ".updateViewCnt", bno);
	}

	/* ********************************************************************************** */

	//게시글 전체 조회(1번 게시판)
	@Override
	public List<BoardVO> getBoardListOne(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".getBoardListOne", search);
	}



	//게시글 작성(1번 게시판)
	@Override
	public void insertBoardOne(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insertBoardOne", vo);
	}



	//총 게시글 갯수 확인(1번게시판)
	@Override
	public int getBoardListCntOne(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".getBoardListCntOne", search);		
	}

	/* ********************************************************************************** */

	//게시글 조회(2번 게시판 )
	@Override
	public List<BoardVO> getBoardListTwo(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".getBoardListTwo", search);
	}

	//게시글 작성(2번 게시판)
	@Override
	public void insertBoardTwo(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insertBoardTwo", vo);

	}	

	//총 게시글 갯수 확인(2번게시판)
	@Override
	public int getBoardListCntTwo(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".getBoardListCntTwo", search);
	}

	/* ********************************************************************************** */

	//게시글 조회(3번 게시판 )
	@Override
	public List<BoardVO> getBoardListThree(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".getBoardListThree", search);
	}

	//게시글 작성(3번 게시판)
	@Override
	public void insertBoardThree(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insertBoardThree", vo);

	}	

	//총 게시글 갯수 확인(3번게시판)
	@Override
	public int getBoardListCntThree(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".getBoardListCntThree", search);
	}

	/* ********************************************************************************** */

	//게시글 조회(4번 게시판 )
	@Override
	public List<BoardVO> getBoardListFour(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".getBoardListFour", search);
	}

	//게시글 작성(4번 게시판)
	@Override
	public void insertBoardFour(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insertBoardFour", vo);

	}	

	//총 게시글 갯수 확인(4번게시판)
	@Override
	public int getBoardListCntFour(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".getBoardListCntFour", search);
	}

	/* ********************************************************************************** */

	//게시글 조회(5번 게시판 )
	@Override
	public List<BoardVO> getBoardListFive(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".getBoardListFive", search);
	}

	//게시글 작성(5번 게시판)
	@Override
	public void insertBoardFive(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insertBoardFive", vo);

	}	

	//총 게시글 갯수 확인(5번게시판)
	@Override
	public int getBoardListCntFive(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".getBoardListCntFive", search);
	}

	/* ********************************************************************************** */

	//게시글 조회(6번 게시판 )
	@Override
	public List<BoardVO> getBoardListSix(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".getBoardListSix", search);
	}

	//게시글 작성(6번 게시판)
	@Override
	public void insertBoardSix(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insertBoardSix", vo);

	}	

	//총 게시글 갯수 확인(6번게시판)
	@Override
	public int getBoardListCntSix(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".getBoardListCntSix", search);
	}
}
