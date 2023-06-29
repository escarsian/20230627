package com.yedam.board.service;

import java.util.List;

import com.yedam.board.vo.BoardVO;

public interface BoardService {
	List<BoardVO> boards();
	
	public boolean addBoard(BoardVO vo);
	
	public boolean removeBoard(BoardVO vo);
	
	public BoardVO selectBoard(String title);
}
