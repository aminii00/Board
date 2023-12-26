package com.project.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.project.board.vo.BoardVO;

@Mapper
@Repository("boardDAO")
public interface BoardDAO {

	public List<BoardVO> boardList();
	
	public int NewBoardNo();
	
	public void saveBoard(BoardVO board);
	
	public BoardVO boardSearchList(int boardNo);
	
	public List<BoardVO> selectBoardListWithPagingMap(Map condMap);

	public int selectBoardListTotalNum();
}
