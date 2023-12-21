package com.project.board.service;

import java.util.List;

import com.project.board.vo.BoardVO;

public interface BoardService {

	public List<BoardVO> boardList();
	
	public int NewBoardNo();
	
	public void saveBoard(BoardVO board);
}
