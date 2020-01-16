package com.mn.project.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;

	//게시글 상세 보기
	@Override
	public BoardVO getBoardContent(int bno) throws Exception {
		// TODO Auto-generated method stub				
		dao.updateViewCnt(bno);		
		return dao.getBoardContent(bno);
	}

	//게시글 수정
	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateBoard(vo);
	}

	//게시글 삭제
	@Override
	public void deleteBoard(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteBoard(bno);
	}

	//조회수 변경
	@Override
	public int updateViewCnt(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateViewCnt(bno);
	}

	/* ********************************************************************************** */

	//게시글 전체 조회(1번 게시판)
	@Override
	public List<BoardVO> getBoardListOne(Search search) throws Exception {

		return dao.getBoardListOne(search);
	}

	//게시글 작성(1번 게시판)
	@Override
	public void insertBoardOne(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertBoardOne(vo);
	}	

	//총 게시글 갯수 확인(1번게시판)
	@Override
	public int getBoardListCntOne(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardListCntOne(search);
	}

	/* ********************************************************************************** */

	//게시글 조회(2번 게시판 )
	@Override
	public List<BoardVO> getBoardListTwo(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardListTwo(search);
	}

	//게시글 작성(2번 게시판)
	@Override
	public void insertBoardTwo(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertBoardTwo(vo);

	}

	//총 게시글 갯수 확인(2번게시판)
	@Override
	public int getBoardListCntTwo(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardListCntTwo(search);
	}

	/* ********************************************************************************** */

	//게시글 조회(3번 게시판 )
	@Override
	public List<BoardVO> getBoardListThree(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardListThree(search);
	}

	//게시글 작성(3번 게시판)
	@Override
	public void insertBoardThree(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertBoardThree(vo);

	}

	//총 게시글 갯수 확인(3번게시판)
	@Override
	public int getBoardListCntThree(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardListCntThree(search);
	}

	/* ********************************************************************************** */

	//게시글 조회(4번 게시판 )
	@Override
	public List<BoardVO> getBoardListFour(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardListFour(search);
	}

	//게시글 작성(4번 게시판)
	@Override
	public void insertBoardFour(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertBoardFour(vo);

	}

	//총 게시글 갯수 확인(4번게시판)
	@Override
	public int getBoardListCntFour(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardListCntFour(search);
	}

	/* ********************************************************************************** */

	//게시글 조회(5번 게시판 )
	@Override
	public List<BoardVO> getBoardListFive(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardListFive(search);
	}

	//게시글 작성(5번 게시판)
	@Override
	public void insertBoardFive(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertBoardFive(vo);

	}

	//총 게시글 갯수 확인(5번게시판)
	@Override
	public int getBoardListCntFive(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardListCntFive(search);
	}

	/* ********************************************************************************** */
	
	//게시글 조회(6번 게시판 )
		@Override
		public List<BoardVO> getBoardListSix(Search search) throws Exception {
			// TODO Auto-generated method stub
			return dao.getBoardListSix(search);
		}

		//게시글 작성(6번 게시판)
		@Override
		public void insertBoardSix(BoardVO vo) throws Exception {
			// TODO Auto-generated method stub
			dao.insertBoardSix(vo);

		}

		//총 게시글 갯수 확인(6번게시판)
		@Override
		public int getBoardListCntSix(Search search) throws Exception {
			// TODO Auto-generated method stub
			return dao.getBoardListCntSix(search);
		}
		
}
