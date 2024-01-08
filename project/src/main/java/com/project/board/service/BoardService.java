package com.project.board.service;

import java.util.List;
import java.util.Map;

import com.project.board.vo.BoardVO;

public interface BoardService {

	public List<BoardVO> boardList();
	
	public int NewBoardNo();
	
	public void saveBoard(BoardVO board);
	
	public BoardVO boardSearchList(int boardNo);
	
	public int selectBoardListTotalNum(Map pagingMap);
	
	public List<BoardVO> selectBoardListWithPagingMap(Map pagingMap);
	
	public void boardCancel(int boardNo);

}
