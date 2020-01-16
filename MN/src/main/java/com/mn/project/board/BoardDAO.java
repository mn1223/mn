package com.mn.project.board;

import java.util.List;

public interface BoardDAO {

	//게시글 상세보기
	public BoardVO getBoardContent(int bno) throws Exception;

	//게시글 수정
	public void updateBoard(BoardVO vo) throws Exception;

	//게시글 삭제
	public void deleteBoard(int bno) throws Exception;

	//조회수 변경
	public int updateViewCnt(int bno) throws Exception;

	/* ********************************************************************************** */	

	//게시글 전체 조회(1번 게시판)
	public List<BoardVO> getBoardListOne(Search search) throws Exception;

	//게시글 작성(1번 게시판)
	public void insertBoardOne(BoardVO vo) throws Exception;

	//총 게시글 갯수 확인(1번게시판)
	public int getBoardListCntOne(Search search) throws Exception;

	/* ********************************************************************************** */

	//게시글 조회(2번 게시판)
	public List<BoardVO> getBoardListTwo(Search search) throws Exception;

	//게시글 작성(2번 게시판)
	public void insertBoardTwo(BoardVO vo) throws Exception;

	//총 게시글 갯수 확인(2번게시판)
	public int getBoardListCntTwo(Search search) throws Exception;

	/* ********************************************************************************** */

	//게시글 조회(3번 게시판)
	public List<BoardVO> getBoardListThree(Search search) throws Exception;

	//게시글 작성(3번 게시판)
	public void insertBoardThree(BoardVO vo) throws Exception;

	//총 게시글 갯수 확인(3번게시판)
	public int getBoardListCntThree(Search search) throws Exception;

	/* ********************************************************************************** */

	//게시글 조회(4번 게시판)
	public List<BoardVO> getBoardListFour(Search search) throws Exception;

	//게시글 작성(4번 게시판)
	public void insertBoardFour(BoardVO vo) throws Exception;

	//총 게시글 갯수 확인(4번게시판)
	public int getBoardListCntFour(Search search) throws Exception;

	/* ********************************************************************************** */

	//게시글 조회(5번 게시판)
	public List<BoardVO> getBoardListFive(Search search) throws Exception;

	//게시글 작성(5번 게시판)
	public void insertBoardFive(BoardVO vo) throws Exception;

	//총 게시글 갯수 확인(5번게시판)
	public int getBoardListCntFive(Search search) throws Exception;

	/* ********************************************************************************** */

	//게시글 조회(6번 게시판)
	public List<BoardVO> getBoardListSix(Search search) throws Exception;

	//게시글 작성(6번 게시판)
	public void insertBoardSix(BoardVO vo) throws Exception;

	//총 게시글 갯수 확인(6번게시판)
	public int getBoardListCntSix(Search search) throws Exception;


}
