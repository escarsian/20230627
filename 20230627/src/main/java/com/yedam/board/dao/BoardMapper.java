package com.yedam.board.dao;

import java.util.List;

import com.yedam.board.vo.BoardVO;

public interface BoardMapper {
	public List<BoardVO> boards();
	public int insert(BoardVO vo);
	public int remove(BoardVO vo);
	public BoardVO select(String title);
}
